# Maintainer: Damglador <damglador@gmail.com>

pkgname=osspd
pkgver=1.3.3
pkgrel=3
pkgdesc="Emulate Open Sound System device(s) using CUSE"
arch=('any')
url="https://github.com/OpenMandrivaSoftware/ossp"
_commit=72f82cc7b98f026c6827743d8f48bd43f6b49b32
depends=(fuse3 pulse-native-provider)
makedepends=(git cmake make)
license=(GPL-2.0)
source=(
    "${pkgname}::git+https://github.com/OpenMandrivaSoftware/ossp#tag=v${pkgver}" # $url/releases/tag/v1.3.3
    "README.gz"
    "osspd.8.gz"
    "osspd.conf"
    "osspd.service"
)
sha256sums=('7def6c9d02e370e06a96ec051e70b62ffba3e2a0853dcf2ae1c9a159ef548899'
            'ca8e6e40b720051f86f2be34ce0e35aa390de08d06f060abbdcb2b2fb2f4cccc'
            '63b09519b61b2f6158df1b4468477e6db776275d450b8845d83f2c6de6761c22'
            'a720cbbd326c28bc96b81e8bcd8b443d05981a7386e8421baf5fa773c15aa30c'
            'dfeb3012f54a34abaa6633f2ea1a47ca798f31a111c5d99f95a0d884baaccc0f')

build(){
    cd $pkgname
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
    make
}

package() {
    cd $pkgname
    install -Dm755 osspd ossp-padsp -t "$pkgdir/usr/bin/"
    install -Dm644 98-osscuse.rules -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 LICENSE          -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 ../README.gz     -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 ../osspd.8.gz    -t "$pkgdir/usr/share/man/man8/"
    install -Dm644 ../osspd.conf    -t "$pkgdir/usr/lib/modules-load.d/"
    install -Dm644 ../osspd.service -t "$pkgdir/usr/lib/systemd/system/"
}
