# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=quest-discord-presence-client-git
pkgver=r48.09b53cf
pkgrel=1
pkgdesc="An alternative client for Oculus Quest Beat Saber Discord RPC"
arch=('x86_64')
url="https://github.com/Lauriethefish/Quest-Discord-Presence-Client"
license=('ZLIB')

depends=('dotnet-runtime')
makedepends=(
  'git'
  'dotnet-host'
  'dotnet-sdk'
)
provides=()
conflicts=()
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

publish_dir="/bin/Release/netcoreapp3.1/arch-x64/publish"

build() {
  cd "${srcdir}/${pkgname}"
  dotnet clean
  dotnet restore
  dotnet publish -r arch-x64 -c Release
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"

  cp -a "${srcdir}/${pkgname}/${publish_dir}/". "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/Quest-Discord-Presence-Client" "${pkgdir}/usr/bin/quest-discord-presence-client"
}
