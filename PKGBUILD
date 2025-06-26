# Maintainer: Matilde Morrone <aur at morrone dot dev>
# Contributor: iamawacko <iamawacko@protonmail.com>

pkgname=gupax
pkgver=1.3.10
pkgrel=2
pkgdesc="GUI Uniting P2Pool And XMRig "
arch=('x86_64')
url="https://github.com/hinto-janai/gupax"
license=('GPL-3.0')
depends=('p2pool' 'xmrig')
makedepends=('cargo' 'openssl')
source=("git+$url#tag=v$pkgver" gupax.desktop package.patch)
b2sums=('9d922f740b43fe598ef48a21f16c3eb591d1f7b4f99eff25b4e16b637497d2ddf58302a7bde2dee4da3d8b23a2d4a6f0073674dfa73199d32bd6747ed01accda'
        'd2f13b48123ec84a09aff523baf49a74434c839b88c3f2dbf0841f820194a301d4ffe4569eaff427c2880029fc0a76e4362c0066f2047f31a2dbdf3be96fd369'
        '5f49581bd632749c9b60d3a74310bade3ed0d5e873a52eedfada255ca51236a8578081bb8c5f5fe4e7581f65ab97bd49eddb0806f9049fd61365852cad653344')

prepare() {
    patch -d $pkgname -Np1 -i ../package.patch
}

build() {
    cd $pkgname
    cargo build --release --features distro
}

package() {
    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Icons
    install -Dm644 "$pkgname/images/icons/icon.ico" "$pkgdir/usr/share/$pkgname/icon.ico"
    install -Dm644 "$pkgname/images/icons/icon.png" "$pkgdir/usr/share/$pkgname/icon.png"
    install -Dm644 "$pkgname/images/icons/icon@2x.png" "$pkgdir/usr/share/$pkgname/icon@2x.png"

    # Desktop entry
    install -Dm644 gupax.desktop "$pkgdir/usr/share/applications/gupax.desktop"
}
