pkgdesc="Zinc is a stand-alone version of sbt's incremental compiler"
pkgname="zinc"
pkgver=0.3.13
pkgrel=0
url="https://github.com/typesafehub/zinc"
arch=('any')
license=('Apache')
depends=('java-environment')
provides=('zinc')
conflicts=('zinc-git')
source=(
    "http://downloads.typesafe.com/zinc/$pkgver/zinc-$pkgver.tgz"
    "zincer.sh" # server launcher
    "zincer.conf" # service env vars
    "zincer.service" # systemd service
)
backup=(
    'etc/conf.d/zincer.conf'
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
options=('!strip')

# 1.
prepare() {
    true
}

# 2.
build() {
    true
}

# 3.
check() {
    true
}

# 4.
package() {
    local home="/opt/zinc"
    local source="$pkgname-$pkgver"
    local target="$pkgdir/$home"
    
    mkdir -p "$target"
    cp -a "$source/." "$target/"
    
    install -D -m755 zincer.sh         "$target/zincer.sh"
    install -D -m644 zincer.conf       "$pkgdir/etc/conf.d/zincer.conf"
    install -D -m644 zincer.service    "$pkgdir/usr/lib/systemd/system/zincer.service"
    
    mkdir -p $pkgdir/usr/bin
    ln -s "$home/bin/zinc"             "$pkgdir/usr/bin/zinc"
    ln -s "$home/zincer.sh"            "$pkgdir/usr/bin/zincer"
}
