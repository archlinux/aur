pkgname=redmine-plugin-apijs
pkgver=6.9.6
pkgrel=2
pkgdesc="Plugin for Redmine to display a gallery from attachments"
arch=('any')
url='https://github.com/luigifab/redmine-apijs'
license=('GPL2' 'MIT' 'OFL')
depends=('redmine' 'python-pillow' 'scour' 'perl-image-exiftool')
optdepends=('ffmpegthumbnailer: for video thumbnail support')
source=("https://github.com/luigifab/redmine-apijs/archive/v${pkgver}/redmine-apijs-${pkgver}.tar.gz")
md5sums=("12ad96f313c1e904ce7f3f03cef80fc9")

prepare() {
  mv "redmine-apijs-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -i "s/ version '[0-9].[0-9].[0-9]/&-zst/g" src/init.rb
}

package() {
  cd "$pkgname-$pkgver"

  # the entire source code is GPL-2.0-or-later, except lib/useragentparser.rb which is MIT and assets/fonts/apijs/fontello.woff(2) which is OFL-1.1
  install -dm 755 "$pkgdir/usr/share/webapps/redmine/lib/plugins/redmine_apijs/"
  cp -a src/*     "$pkgdir/usr/share/webapps/redmine/lib/plugins/redmine_apijs/"
  chmod -R o=     "$pkgdir/usr/share/webapps/redmine/lib/plugins/redmine_apijs/"
  chmod +x        "$pkgdir/usr/share/webapps/redmine/lib/plugins/redmine_apijs/lib/image.py"

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}