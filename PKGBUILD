# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-gmail
pkgver=1.0.5
pkgrel=1
pkgdesc='Get notifications and unread messages count from Gmail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-gmail'
license=('MIT')
depends=('python-google-api-python-client' 'python-google-auth-httplib2' 'python-google-auth-oauthlib' 'python-gobject' 'python-dasbus')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-gmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('95af11760844d063c212c63d7d8f4d8a4f582a439e06d7ed2404bba20ed1f2e0ab999eae331886322b2bd9ccd71c2c3b4f3f8cbfbff83236a155c0ccac017407')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
