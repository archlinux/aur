# Maintainer: Luke Arms <luke@arms.to>

pkgbase=dotnet-core-3.1-bin
pkgname=(
    'dotnet-runtime-3.1-bin'
    'aspnet-runtime-3.1-bin'
    'dotnet-sdk-3.1-bin'
    'dotnet-targeting-pack-3.1-bin'
    'aspnet-targeting-pack-3.1-bin'
)
pkgver=3.1.26.sdk420
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_x86_64=("https://download.visualstudio.microsoft.com/download/pr/5424da8c-ce12-46de-a51a-8fa61aefdde6/52a9d6b5718ea40863db96901c780d4b/dotnet-sdk-3.1.420-linux-x64.tar.gz")
source_armv7h=("https://download.visualstudio.microsoft.com/download/pr/78abce54-388a-418f-85e0-cf3c6a0e7d35/98d1ee575a0369c97c3d14ee0e1085a8/dotnet-sdk-3.1.420-linux-arm.tar.gz")
source_aarch64=("https://download.visualstudio.microsoft.com/download/pr/a84bf296-ee6e-4e66-9694-90d3da7af2b4/b00b2efe2432938e5a19c45d3759d80f/dotnet-sdk-3.1.420-linux-arm64.tar.gz")
sha512sums_x86_64=('b3bdd964182f9edc3c2976541e657fcc43b0eaf9bc97197597c7ecb8b784d79e3efb9e0405c84e1dcb434cf4cd38ddc4af628c5df486c3d7ae8a23e5254796e3')
sha512sums_armv7h=('d61cc1a5dc345d4c32bb06bcce1e50d603103294783460c811a87635eb14fc51c58869456f3326cfb689fdb7b379d2410f5db5bf63332aff173814035a319c28')
sha512sums_aarch64=('ac66b1544fe178153bb85c2e5be584464374ce4c036fc95720547c231c2730312018fbdfc735f9071579749415bc54e1f6b8f080cc2b08d5799a0da941e8a5f5')

package_dotnet-runtime-3.1-bin() {
    pkgdesc='The .NET Core runtime'
    depends=('dotnet-host' 'gcc-libs' 'glibc' 'icu' 'libcurl.so' 'libgssapi_krb5.so' 'libunwind' 'openssl' 'zlib')
    optdepends=('lttng-ust2.12: CoreCLR tracing')
    provides=('dotnet-runtime-3.1')
    conflicts=('dotnet-runtime-3.1')

    install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
    cp -dr --no-preserve=ownership shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
    ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime-3.1
}

package_aspnet-runtime-3.1-bin() {
    pkgdesc='The ASP.NET Core runtime'
    depends=('dotnet-runtime-3.1')
    provides=('aspnet-runtime-3.1')
    conflicts=('aspnet-runtime-3.1')

    install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
    cp -dr --no-preserve=ownership shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
    ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-runtime-3.1
}

package_dotnet-sdk-3.1-bin() {
    pkgdesc='The .NET Core SDK'
    depends=('dotnet-runtime-3.1' 'gcc-libs' 'glibc' 'dotnet-targeting-pack-3.1' 'netstandard-targeting-pack')
    provides=('dotnet-sdk-3.1')
    conflicts=('dotnet-sdk-3.1')

    install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
    cp -dr --no-preserve=ownership sdk templates "${pkgdir}"/usr/share/dotnet/
    ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk-3.1
}

package_dotnet-targeting-pack-3.1-bin() {
    pkgdesc='The .NET Core targeting pack'
    depends=('netstandard-targeting-pack')
    provides=('dotnet-targeting-pack-3.1')
    conflicts=('dotnet-targeting-pack-3.1')

    case "$CARCH" in
    x86_64)
        _arch=x64
        ;;
    armv7h)
        _arch=arm
        ;;
    aarch64)
        _arch=arm64
        ;;
    esac

    install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
    cp -dr --no-preserve=ownership packs/Microsoft.NETCore.App.{Host.linux-${_arch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
    ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-3.1
}

package_aspnet-targeting-pack-3.1-bin() {
    pkgdesc='The ASP.NET Core targeting pack'
    depends=('dotnet-targeting-pack-3.1')
    provides=('aspnet-targeting-pack-3.1')
    conflicts=('aspnet-targeting-pack-3.1')

    install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
    cp -dr --no-preserve=ownership packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
    ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-3.1
}
