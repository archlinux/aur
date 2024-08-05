# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=gssg-git
_pkgname=gssg
pkgver=r7.fc755f2
pkgrel=1
pkgdesc='Gemini static site generator'
url='https://git.sr.ht/~gsthnz/gssg'
arch=('x86_64')
license=('GPL3')
provides=('gssg')
conflicts=('gssg')
makedepends=('go' 'git')
source=("git+$url")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_pkgname}
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "$pkgdir/opt/${_pkgname}/README.md"
  install -Dm755 "${srcdir}/${_pkgname}/gssg" "$pkgdir/usr/bin/gssg"
}
