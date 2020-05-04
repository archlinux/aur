# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname="zinc"
pkgver=1.4.0M2
_pkgver=1.4.0-M2
pkgrel=0
pkgdesc="Zinc is a stand-alone version of sbt's incremental compiler"
url="https://github.com/sbt/zinc"
arch=('any')
license=('Apache')
depends=('java-environment')
provides=('zinc')
conflicts=('zinc-git')
source=(
    "https://github.com/sbt/zinc/archive/v${_pkgver}.tar.gz"
    "zincer.sh" # server launcher
    "zincer.conf" # service env vars
    "zincer.service" # systemd service
)
backup=(
    'etc/conf.d/zincer.conf'
)
sha512sums=('bf38cd704dcdc5f4bc1f74019710b277890ea2646a716ba9f76872c6b0516751a8495c3247138bb8e37f29f14a22d9d86fde9349631bc7da29b3313c6fbcefa9'
            '118c70ad6607a73b3f5b173e8404b0c292e198d72c8f5f33b8f0fe03d3cb5a1b5b41678fe416a865edbf7c4bfdf20f3c48ed7d7800bcda0a223184f90de4e06c'
            '7fafe0e7730529e421470edd544bccf1e626d81112a7542bb6a45896a0d04d8315fa496bef528544c04a25a5782cdd5cc199a1e88a9b8016ead24900e9e3dc02'
            'b9ccb6229420e9d61bfcd058eb03130423a0530135cfbf9e0f6de87f0b72f01f0d9d5489d04b6cf52f962f1fc7bd1928a57c46433601c20e967f2dc9426fec88')
options=('!strip')

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
