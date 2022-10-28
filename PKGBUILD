# Maintainer: Luke Arms <luke@arms.to>

pkgbase=dotnet-core-3.1-bin
pkgname=(
    'dotnet-runtime-3.1-bin'
    'aspnet-runtime-3.1-bin'
    'dotnet-sdk-3.1-bin'
    'dotnet-targeting-pack-3.1-bin'
    'aspnet-targeting-pack-3.1-bin'
)
pkgver=3.1.30.sdk424
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/28fd6fc0-f484-43d0-90cf-5e297a784e44/09c0612bb1cc46378546dfbdfd83014e/dotnet-sdk-3.1.424-linux-x64.tar.gz')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/abae2803-1012-48e2-a720-355795f80d79/47650a0b203a6f28019fe6f68215528e/dotnet-sdk-3.1.424-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/dfe62f78-d4c1-4190-9d9d-44249e83a0c5/1fb0e84fb45e4e5d3207de6db85d99c3/dotnet-sdk-3.1.424-linux-arm64.tar.gz')
sha512sums_x86_64=('5f9fc353eb826c99952582a27b31c495a9cffae544fbb9b52752d2ff9ca0563876bbeab6dc8fe04366c23c783a82d080914ebc1f0c8d6d20c4f48983c303bf18')
sha512sums_armv7h=('4ca319e7cdfcd318cb0d649d83a93f1ac87a7a777f454a0a71ff7e87bae1ef8020e789edb4bfa172c091edc66b1e5dce0faa0950cb95a93953863c76721ce11f')
sha512sums_aarch64=('3bfd29233a3e0dfdbdc967f07808d4e239651f0f4f23f7c9e74f09271c9ded8044539ea4278bad070504ad782c4638a493bd9026ddbc97bbc657c5c12c27ccd2')

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
