# Maintainer: Luke Arms <luke@arms.to>

pkgbase=dotnet-core-3.1-bin
pkgname=(
    'dotnet-runtime-3.1-bin'
    'aspnet-runtime-3.1-bin'
    'dotnet-sdk-3.1-bin'
    'dotnet-targeting-pack-3.1-bin'
    'aspnet-targeting-pack-3.1-bin'
)
pkgver=3.1.32.sdk426
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e89c4f00-5cbb-4810-897d-f5300165ee60/027ace0fdcfb834ae0a13469f0b1a4c8/dotnet-sdk-3.1.426-linux-x64.tar.gz')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/2043e641-977d-43ac-b42a-f47fd9ee79ba/5b10d12a0626adaed720358ab8ad0b7e/dotnet-sdk-3.1.426-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/79f1cf3e-ccc7-4de4-9f4c-1a6e061cb867/68cab78b3f9a5a8ce2f275b983204376/dotnet-sdk-3.1.426-linux-arm64.tar.gz')
sha512sums_x86_64=('6c3f9541557feb5d5b93f5c10b28264878948e8540f2b8bb7fb966c32bd38191e6b310dcb5f87a4a8f7c67a7046fa932cde3cce9dc8341c1365ae6c9fcc481ec')
sha512sums_armv7h=('dd357fa62f486cc9c3855230753b34c070d06c8d3e887753866886dda3c931533c780e02f94fe8e73e66ef504e11dd7fb63a004f5914beeccb36b4ce48f50914')
sha512sums_aarch64=('300e154fba3123644910bbb89a6e61f67569677efa359aa110871cbbb62afad059709dc362f0af27ece0b9a30bc3e6ef57c3cb7c6f75377b20d48636605f30f7')

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
