# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=mango
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool for making backups of Arch packages and their dependencies"
arch=('any')
url="https://gitlab.com/Taro94/mango"
license=('GPL')
depends=('tar' 'pacman')
makedepends=('dotnet-sdk>=6')
source=("https://gitlab.com/Taro94/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f95a3fc5d28b886ae449ffc06cd21e01')
options=(!strip)

build() {
    cd "$pkgname-$pkgver/Mango"
    dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=true -p:PublishReadyToRun=true -o published
    mv published/Mango published/mango
}

package() {
    cd "$pkgname-$pkgver/Mango"
    ls
    install -Dm 755 "published/mango" -t "$pkgdir/usr/bin"
    install -Dm 755 "published/fakepkg.sh" -t "$pkgdir/usr/share/mango"
}
