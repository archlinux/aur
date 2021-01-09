# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=reddio-git
pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}
pkgver=0.3.r26.682e7cb
pkgrel=1

pkgdesc='A command-line interface for Reddit written in POSIX sh'
arch=('any')
url='https://gitlab.com/aaronNG/reddio'
license=('custom:MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('curl' 'jq')
optdepends=('gnu-netcat: authenticate with your Reddit account credentials'
            'openbsd-netcat: authenticate with your Reddit account credentials')
makedepends=('git')

source=("git+$url.git" 'archlinux.patch')
sha256sums=('SKIP'
            '9fadb87b583840fcbcee0845c411c0beda4c471298bf6b8d390eadd5980caf19')

prepare() {
  cd "${pkgname%-git}"
  # Arch packages are never ever installed to `/usr/local/`.
  patch -Np1 <../archlinux.patch
}

package() {
  cd "${pkgname%-git}"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md ISSUES example.png doc/* -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
