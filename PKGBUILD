# Maintainer: Ragnar Groot Koerkamp <ragnar.grootkoerkamp@gmail.com>
pkgname=bapctools-git
_pkgname=bapctools
pkgver=r944.5832b17
pkgrel=1
pkgdesc="Tools for developing ICPC-style programming contest problems."
arch=('any')
url="https://github.com/RagnarGrootKoerkamp/BAPCtools"
license=('GPL 3.0')
depends=('python3' 'python-yaml' 'python-colorama' 'python-argcomplete' 'python-ruamel-yaml')
optdepends=('gcc: for compiling c++ sources',
			'clang: for compiling c++ sources',
			'pypy3: for running python submissions with pypy',
			'python2: for running python2 submissions',
			'pypy: for running python2 submissions with pypy',
			'jdk11-openjdk: for running java submissions',
			'kotlin: for running kotlin submissions',
			'texlive: for building problem statements',
			'texlive-latexextra: for building problem statements',
			'texlive-pictures: for building problem statements',
			'texlive-science: for building problem statements',
			'ghostscript: for LaTeX figures',
			'asymptote: for visualizations'
			)
makedepends=('git')
source=("${_pkgname}::git+https://github.com/RagnarGrootKoerkamp/BAPCtools")
install=bapctools.install
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/shared/licenses/${_pkgname}/LICENSE"

	# Strip large directories to halve the size of the install.
	rm -rf "$srcdir/${_pkgname}/doc/images" "$srcdir/${_pkgname}/test"
	mkdir -p "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/tools.py" "$pkgdir/usr/bin/bt"
}
