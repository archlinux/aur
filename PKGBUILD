# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=mango
pkgver=1.4.3
pkgrel=1
pkgdesc="A tool for making backups of Arch packages and their dependencies"
arch=('any')
url="https://gitlab.com/Taro94/mango"
license=('GPL')
depends=('tar')
makedepends=('dotnet-sdk-3.1')
source=("https://gitlab.com/Taro94/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('ca47e93b557b6b4173e54bd585303dae')
options=(!strip)

package() {
	cd "$pkgname-$pkgver"
    dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=true -o published
    install -Dm 755 "published/${pkgname}" -t "$pkgdir/usr/bin"
    install -Dm 755 "mango/fakepkg.sh" -t "$pkgdir/usr/share/mango"
}
