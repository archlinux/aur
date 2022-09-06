# Maintainer: Mike Yuan <me@yhndnzj.com>
# Contributor: Felix Yan <felixonmars@gmail.com>

pkgname=bind-china-list-git
_srcname=dnsmasq-china-list
pkgver=0.145235.fc5efcff0c
pkgrel=1
pkgdesc="Configuration for hot China domains to accelerate via BIND"
arch=('any')
url="https://github.com/felixonmars/dnsmasq-china-list"
license=('WTFPL')
makedepends=('git')
source=("git+https://github.com/felixonmars/dnsmasq-china-list.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$_srcname"
    make SERVER=119.29.29.29 bind
}

package() {
    depends=('bind')

    cd "$_srcname"
    install -Dt "$pkgdir/etc/named.conf.d" -m644 accelerated-domains.china.bind.conf google.china.bind.conf apple.china.bind.conf
}
