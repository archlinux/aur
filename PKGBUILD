# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on the bapctools-git AUR package from
# Contributor: Ragnar Groot Koerkamp <ragnar.grootkoerkamp@gmail.com>
pkgname=bapctools
_pkgname=BAPCtools
pkgver=2026.3.1
pkgrel=1
pkgdesc="Tools for developing ICPC-style programming contest problems."
arch=('any')
url="https://github.com/RagnarGrootKoerkamp/BAPCtools"
license=('GPL 3.0')
depends=('python3' 'python-yaml' 'python-colorama' 'python-argcomplete' 'python-ruamel-yaml' 'python-vermin')
optdepends=('gcc: for compiling c++ sources',
	'clang: for compiling c++ sources',
	'pypy3: for running python submissions with pypy',
	'pypy: for running python2 submissions with pypy',
	'jdk11-openjdk: for running java submissions',
	'kotlin: for running kotlin submissions',
	'texlive-core: for building problem statements',
	'texlive-latexextra: for building problem statements',
	'texlive-pictures: for building problem statements',
	'texlive-science: for building problem statements',
	'ghostscript: for LaTeX figures',
	'python-matplotlib: for generating solve stats',
	'python-questionary: for better prompts in new_contest and new_problem',
	'python-requests: for commands that call the DOMjudge or Slack API',
	'asymptote: for visualizations'
)
makedepends=('rsync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RagnarGrootKoerkamp/BAPCtools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c66ca9533c7937c9190b6a840a31445883a6f1786595594d7cdc3fe66c27f76e')
install=bapctools.install

package() {
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Strip large directories to halve the size of the install.
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	rsync -aC --exclude "/test" --exclude "/doc/images" -r "${srcdir}/${_pkgname}-${pkgver}/" "${pkgdir}/usr/share/${pkgname}"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/${pkgname}/bin/tools.py" "$pkgdir/usr/bin/bt"
}
