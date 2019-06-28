# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Henrik Gaßmann <henrik at gassmann dot onl>
# Contributor: Alexander Jesner <alexander at jesner dot eu>
# Forked from https://aur.archlinux.org/packages/nuget4/

pkgname=nuget-nightly
pkgver=5.2.0.rtm.6067
pkgrel=1
pkgdesc="Package manager for .NET (nightly version)"
arch=('any')
url="http://www.nuget.org"
license=('apache')
depends=('mono>=5.0.0' 'sh')
makedepends=('xmlstarlet')
conflicts=('nuget' 'nuget2' 'nuget3' 'nuget4' 'nuget5')
provides=('nuget' "nuget=${pkgver}")
source=("NuGet.CommandLine.$((((RANDOM)*32768+RANDOM)*32768+RANDOM)).nupkg"::'https://dotnet.myget.org/F/nuget-build/api/v2/package/NuGet.CommandLine'
        'nuget')
install="${pkgname}.install"
sha384sums=('SKIP'
            'caf34ef83623a2cb6107e067af4af1dcc150d4802f2926d974e15a9ee7fb735a6785b7fd5313a31edbd6f81cb5c51799')

pkgver() {
    xml sel -N nuspec='http://schemas.microsoft.com/packaging/2011/10/nuspec.xsd' \
            -t -v '/nuspec:package/nuspec:metadata[nuspec:id[text()="NuGet.CommandLine"]]/nuspec:version' \
            "${srcdir}/NuGet.CommandLine.nuspec" | sed -e 's/://g' -e 's/\///g' -e 's/-/./g' -e 's/[[:space:]]//g'
}

package() {
    install -d "${pkgdir}/usr/lib/nuget"
    install -d "${pkgdir}/usr/bin"

    install -m 0644 "${srcdir}/tools/NuGet.exe" "${pkgdir}/usr/lib/nuget/NuGet.exe"
    install -m 0644 "${srcdir}/tools/NuGet.pdb" "${pkgdir}/usr/lib/nuget/NuGet.pdb"
    install -m 0755 "${srcdir}/nuget" "${pkgdir}/usr/bin/nuget"
}

