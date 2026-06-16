# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.co>
pkgname=('fs2-knossos-dotnet')
pkgver=v1.3.8
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
sha512sums=('ff064d0646dd09d5d26b884c1e634f0e4e1ff4ca425b23ee029c92c98f8e8daac69c89b0a31e5ca0843e8bf9782f92e2f62db4af4800f289a11b506dbb1aeca1'
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
