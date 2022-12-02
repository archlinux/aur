# Maintainer: Hans-Nikolai Viessmann <hans at viess dot mn>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois . archlinux . org>

pkgname=tllocalmgr-git
pkgver=v0.8.r2.67e838e
pkgrel=1
pkgdesc='A shell and command-line utility to manage TeXLive on Arch Linux'
arch=('any')
url='https://github.com/hv15/tllocalmgr'
license=('GPL')
provides=("texlive-localmanager=$pkgver")
conflicts=('texlive-localmanager'
           'texlive-localmanager-git'
           "${pkgname%-git}")
depends=('texlive-core>=2016'
         'perl-libwww'
         'perl-term-shellui'
         'perl-term-readline-gnu'
         'perl-list-moreutils'
         'perl-lwp-protocol-https')
makedepends=('git')

source=("${pkgname%-git}::git+https://github.com/hv15/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/"{bin,share/tllmgr/TLLocalMgr}
  install -m755 tllocalmgr "$pkgdir/usr/bin/"
  cd tllmgr/TLLocalMgr
  for _f in *; do
    install -m644 "$_f" "$pkgdir/usr/share/tllmgr/TLLocalMgr/"
  done
}
