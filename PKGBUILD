# Maintainer: yms_hi <yms_hi@Outlook.com>
pkgname=('cangjie-lts-bin' 'cangjie-lts-tools-bin' 'cangjie-lts-runtime-bin')
pkgver="1.0.0"
pkgrel=1
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
source_x86_64=("Cangjie-$pkgver-linux-amd64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=cangjie-sdk-linux-x64-1.0.0.tar.gz&objectKey=68637fc53bcda926055851db")
sha256sums_x86_64=('8894E63A181BC0534AF24263B449C2D8D4D9DFB16FF1270B793499FE06CE6DCF')
source_aarch64=("Cangjie-$pkgver-linux-aarch64.tar.gz::https://cangjie-lang.cn/v1/files/auth/downLoad?nsId=142267&fileName=cangjie-sdk-mac-aarch64-1.0.0.tar.gz&objectKey=68637e5c3bcda926055851d9")
sha256sums_aarch64=('E8CDF8570678D116B99186411DA94A425F2FEBC5EEE84624A98A5BE7DF03158D')
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
