# Maintainer: Luke Arms <luke@arms.to>

pkgbase=dotnet-core-3.1-bin
pkgname=(
    'dotnet-runtime-3.1-bin'
    'aspnet-runtime-3.1-bin'
    'dotnet-sdk-3.1-bin'
    'dotnet-targeting-pack-3.1-bin'
    'aspnet-targeting-pack-3.1-bin'
)
pkgver=3.1.29.sdk423
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e137cdac-0e15-46ec-bd60-14fe6ad50c41/30c102677cc4bd0f117cc026781ec5e8/dotnet-sdk-3.1.423-linux-x64.tar.gz')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/8f81b133-220b-4831-abe6-e8be161fd9a2/1af75b5e2ca89af2a31cf9981a976832/dotnet-sdk-3.1.423-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/11abab07-d7a2-46b0-9ab5-19d5db67212f/783196073ecbd9fd64378fec412affbe/dotnet-sdk-3.1.423-linux-arm64.tar.gz')
sha512sums_x86_64=('bcb0efcc066a668eb390b57fd2c944abe73234fdbed57a4b1d21af5b880d102b765f2a790bb137d4b9f3d0d4e24fc53d39dc7666e665624c12e07d503c54ceae')
sha512sums_armv7h=('6b615ec6c1d66280c44ff28de0532ff6a4c21c77caf188101b04bdd58e8935436cb2b049ad9d831799476d421e25795184615c7e1caff8e550855e2f6ed5efd9')
sha512sums_aarch64=('ba4f82e939be43ed863f059f69cdfb80b6dfe7cf99638bd6e787b060c2c1c4934440b599c133f61e3a0995f73675ae5d927bb047597cdd6a15b9074891dfd62e')

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
