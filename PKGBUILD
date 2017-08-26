# Maintainer: Andrew Dunai <andrew@dun.ai>
# Contributor: Damien Flament <damien.flament@gmx.com>
pkgname=voxelshop
_pkgname_upper=VoxelShop
pkgver=1.8.02
pkgrel=2
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
sha256sums=('0158a4e52afc88c9d9c6341f50c237383e1781c18a25060c93989877e2f71aa7'
            '86c1fd50ef32b17be92df37d6a5c2206e456d99bc7abe4da80a44f49d2a377d3')
arch=('any')

package() {
  # Install the distributed files in /opt
  cd "${srcdir}/${_pkgname_upper}"

  install -Dm755 -t "${pkgdir}/opt/${pkgname}" data/*

  # Generate the startup script
  cd "${srcdir}"
  sed -i "s/{{pkgname}}/${pkgname}/g" "${pkgname}"

  install -D -t "${pkgdir}/usr/bin" "${pkgname}"
  
  # Add a symlink to the startup script using the camel-cased package name
  ln -s "${pkgname}" "${pkgdir}/usr/bin/${_pkgname_upper}"
}

