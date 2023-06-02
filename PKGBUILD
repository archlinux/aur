# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jack Random <jack at random dot to>
# Contributor: Rasmus Steinke <rasi at xssn dot at>

set -u
pkgname='buku-git'
_pkgname="${pkgname%-git}"
pkgver=4.8.r7.gdb054e1
pkgrel=1
pkgdesc='Powerful command-line bookmark manager.'
arch=('any')
url='https://github.com/jarun/Buku'
license=('GPL3')
depends=('python>=3.9' 'python-beautifulsoup4' 'python-cryptography' 'python-urllib3' 'python-certifi' 'python-html5lib')
makedepends=('make')
makedepends+=('git')
provides=("buku=${pkgver%%.r*}")
conflicts=('buku')
source=('git+https://github.com/jarun/buku.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}

package() {
  set -u
  cd "${_pkgname}"
  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  python setup.py install --root="${pkgdir}" --prefix='/usr'
  install -Dm644 'auto-completion/fish/buku.fish' -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 'auto-completion/bash/buku-completion.bash' "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 'auto-completion/zsh/_buku' -t "${pkgdir}/usr/share/zsh/site-functions/"
  set +u
}
set +u
