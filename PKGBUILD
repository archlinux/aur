# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=g500-git
_gitname=g500
pkgver=r118.3884fcf
pkgrel=1
pkgdesc="Documentation and code for g500 specific HID protocol for profile configuration and other tweaks"
url="https://github.com/cvuchener/g500"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('bash')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
install=''
source=("git+https://github.com/cvuchener/g500.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}/src"
  make
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}/src"
  install -Dm755 g500-read-block "$pkgdir/usr/bin/g500-read-block"
  install -Dm755 g500-write-block "$pkgdir/usr/bin/g500-write-block"
  install -Dm755 g500-dump-page "$pkgdir/usr/bin/g500-dump-page"
  install -Dm755 g500-fill-page "$pkgdir/usr/bin/g500-fill-page"
  install -Dm755 g500-write-page-lgs "$pkgdir/usr/bin/g500-write-page-lgs"
  install -Dm755 g500-write-page "$pkgdir/usr/bin/g500-write-page"
  install -Dm755 g500-mem-op "$pkgdir/usr/bin/g500-mem-op"
  install -Dm755 g500-set-profile "$pkgdir/usr/bin/g500-set-profile"
  install -Dm755 g500-parse-macro "$pkgdir/usr/bin/g500-parse-macro"
  install -Dm755 g500-parse-profile "$pkgdir/usr/bin/g500-parse-profile"
  install -Dm755 g500-edit-profile "$pkgdir/usr/bin/g500-edit-profile"
  install -Dm755 check-hidraw-logitech-reports "$pkgdir/usr/bin/check-hidraw-logitech-reports"
  install -Dm755 send-raw-request "$pkgdir/usr/bin/send-raw-request"
  install -Dm755 logitech-raw-command "$pkgdir/usr/bin/logitech-raw-command"

  install -Dm644 ../scan-read-command.sh "$pkgdir/usr/bin/"
}
