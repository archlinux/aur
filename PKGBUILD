# Maintainer: yms_hi <yms_hi@Outlook.com>
pkgname=('cangjie-lts-bin' 'cangjie-lts-tools-bin' 'cangjie-lts-runtime-bin')
pkgver="1.0.4"
pkgrel=2
epoch=
arch=('x86_64' 'aarch64')
pkgdesc='Cangjie(Beta Channel)'
url="https://cangjie-lang.cn/"
license=('Apache-2.0')
groups=('cangjie-lts-full')
depends=()
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("Cangjie-$pkgver-linux-amd64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=cangjie-sdk-linux-x64-1.0.4.tar.gz&objectKey=691154b9a1061e7e7ef142dd")
sha256sums_x86_64=('651D94F7BB0BE349C2D3C6F5BE45689187C2703A9BDBA0C8DE117363A1A67D8C')
source_aarch64=("Cangjie-$pkgver-linux-aarch64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=cangjie-sdk-linux-aarch64-1.0.4.tar.gz&objectKey=691155b0a1061e7e7ef142e0")
sha256sums_aarch64=('08FF3207021A127799B2E688DAD30572EC2CACE7F5C72DEBF6F03F172BC0B61F')
noextract=()
validpgpkeys=()

build(){
        cd "$srcdir/cangjie"
        rm -r ./lib/windows_x86_64_llvm/
        rm -r ./modules/windows_x86_64_llvm/
}

package_cangjie-lts-runtime-bin(){
        provides=("cangjie-runtime=$pkgver")
        depends=('openssl>=3.0.7')
        conflicts=('cangjie-runtime')
        pkgdesc='Runtime for Cangjie(LTS Channel)'
        cd "$srcdir/cangjie"
        install -Dm644 License.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
        mkdir -p "$pkgdir/opt/cangjie/runtime/lib/linux_${CARCH}_llvm/"
        mkdir -p "$pkgdir/usr/lib"
        cp -r "./runtime/lib/linux_${CARCH}_llvm/" "$pkgdir/opt/cangjie/runtime/lib/"
        chmod 755 "$pkgdir/opt/cangjie/runtime/lib/linux_${CARCH}_llvm/" -R
}

package_cangjie-lts-bin() {
        pkgdesc="Cangjie compiler(LTS Channel)"
        provides=("cangjie-bin=$pkgver")
        depends=("cangjie-lts-runtime-bin=$pkgver" 'openssl>=3.0.7')
        conflicts=('cangjie-bin')
        cd "$srcdir/cangjie"
        install -d "$pkgdir/opt/cangjie/bin" "$pkgdir/opt/cangjie/lib/" "$pkgdir/opt/cangjie/modules/"
        install -Dm644 License.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
        cp -r './third_party/' "$pkgdir/opt/cangjie"
        cp -r './bin/' "$pkgdir/opt/cangjie"
        cp -r './lib/' "$pkgdir/opt/cangjie"
        cp -r './modules' "$pkgdir/opt/cangjie"
        chmod 755 "$pkgdir/opt/cangjie/" -R
}

package_cangjie-lts-tools-bin(){
        pkgdesc='Tools for Cangjie(LTS Channel)'
        depends=("cangjie-lts-bin=$pkgver")
        provides=("cangjie-tools=$pkgver")
        conflicts=('cangjie-tools')
        backup=('opt/cangjie/tools/config')
        cd "$srcdir/cangjie"
        install -Dm644 License.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
        install -d "$pkgdir/opt/cangjie/tools"
        cp -r './tools' "$pkgdir/opt/cangjie/"
        cp './envsetup.sh' "$pkgdir/opt/cangjie/"
        chmod 755 "$pkgdir/opt/cangjie/" -R
}
