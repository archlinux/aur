# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>
pkgname=voxelshop
_pkgname_upper=VoxelShop
pkgver=1.8.02
pkgrel=3
pkgdesc='An extremely intuitive and powerful cross-platform software to modify and create voxel objects which was designed from the ground up in close collaboration with artists.'
url=http://blackflux.com/node/11
license=('Apache')
groups=()
depends=('java-runtime-common' 'bash')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('voxelshop'
        "https://github.com/simlu/voxelshop/releases/download/${pkgver}/VoxelShop-java-all-os-fast.zip")
noextract=()
sha256sums=('849a498d505f7e817c529d5b538f94c82aeaf45a8d75786dcf9651adf3d1d645'
            '86c1fd50ef32b17be92df37d6a5c2206e456d99bc7abe4da80a44f49d2a377d3')
arch=('any')

prepare() {
  # Generate the startup script
  cd "${srcdir}"
  sed -i "s/{{pkgname}}/${pkgname}/g" "${pkgname}"
}

package() {
  # Install the distributed files in /opt
  cd "${srcdir}/${_pkgname_upper}"

  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" data/*
  
  # Install the custom startup script
  cd "${srcdir}"
  install -D -t "${pkgdir}/usr/bin" "${pkgname}"
  
  # Add a symlink to the startup script using the camel-cased package name
  ln -s "${pkgname}" "${pkgdir}/usr/bin/${_pkgname_upper}"
}

