# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-prosession-git
pkgver=0.6.2.r1.g976f3e6
pkgrel=1
pkgdesc="Handle vim sessions like a pro"
arch=('any')
url="https://github.com/dhruvasagar/vim-prosession"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim-obsession')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'LICENSE')
sha256sums=('SKIP'
            '9f0c174a1ebb45f10904046523392104aee46841a90f1508578da86011a6a1ba')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin rplugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
