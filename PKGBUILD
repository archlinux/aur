# Maintainer Solomon Choina <shlomochoina@gmail.com>
# Maintainer Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>

_fname=hack
pkgname=ttf-$_fname-ibx
pkgver=3.003
pkgrel=4
pkgdesc='A typeface designed for source code'
url="http://sourcefoundry.org/$_fname/"
arch=('any')
groups=('infinality-bundle-fonts')
provides=('ttf-hack')
conflicts=('ttf-hack')
license=('MIT' 'custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/source-foundry/${_fname^}/archive/v$pkgver.tar.gz"
        "90-tt-$_fname.conf")
sha256sums=('3c6f1a20e86744077e83c9bacf879a5b13f659f1c07e9c5c57d6efc3cbe66c07'
            '9535ddbef1e641a48621c7514970cc3a96a4ea54f1528aa6daea49ae69db9f4d')

package() {
  cd "${_fname^}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname/" \
    build/ttf/*.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" \
    config/fontconfig/*.conf "../90-tt-$_fname.conf"
  install -Dm644 -t "$pkgdir/usr/share/licences/" LICENSE.md docs/CONTRIBUTORS.md
  install -Dm644 -t "$pkgdir/usr/share/doc/" CHANGELOG.md FAQ.md README.md
  install -m755 -d "$pkgdir/etc/fonts/conf.d"
  cd "$pkgdir"/etc/fonts/conf.d
  ln -s ../conf.avail/*.conf ./
}
