# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.co>
pkgname=('fs2-knossos-dotnet')
pkgver=v1.3.5
_extpkgname='Knossos.NET'
pkgrel=1
pkgdesc="A multi platform launcher for Freespace 2 Open using .NET 6.0 and AvaloniaUI"
arch=('x86_64')
url='https://github.com/KnossosNET/Knossos.NET'
license=('GPL-3.0-only')
makedepends=(
  'dotnet-sdk-6.0'
  'git'
)
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'dotnet-runtime-6.0'
  'fuse2'
)
conflicts=(
)
validpgpkeys=(
  # Fingerprint from gpg
  # Key from https://github.com/web-flow.gpg
  968479A1AFF927E37D1A566BB5690EEEBB952194
)
source=(
  "git+$url.git#tag=${pkgver}"
  'Knossos.NET.desktop'
)
sha512sums=('817d1f64bbf474558e31423f083645aedecfd616fee3dd525bb90796484ae846158219e0e62fbf7c6b2ef449c1c43b7f465f7a581ce1cacdc8524ab5383fd820'
            '088987d8d0b9ee329c3602f56521e9322feb1dd53d84eccc501dfea25cc00b70f10d9cfc00971848fb41251cd124df45522fd6384fe4ad83748642a05e8a7bfa')
options=(
  !strip # Stripping file Knossos.NET seems to destroy it
)
build() {
  cd "$_extpkgname"
  dotnet publish \
    --framework net6.0 --arch x64 --os linux -p:PublishSingleFile=true --self-contained false \
    $_extpkgname/$_extpkgname.csproj
}
package() {
  install -D -m755 "${srcdir}/$_extpkgname/$_extpkgname/bin/Debug/net6.0/linux-x64/publish/$_extpkgname" \
    "${pkgdir}/usr/bin/$_extpkgname"
  install -D -m644 "${srcdir}/$_extpkgname/packaging/linux/knossos-256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_extpkgname.png"
  install -D -m644 "${srcdir}/Knossos.NET.desktop" \
    "${pkgdir}/usr/share/applications/Knossos.NET.desktop"
}
