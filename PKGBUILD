# Maintainer: lstnbl <jialanxin1996@hotmail.com>

pkgname=vaspkit-bin
pkgver=1.5.1
_swname=vaspkit.${pkgver}
pkgrel=1
pkgdesc="VASPKIT is a postprocessing tool for VASP code.(Warning! May overwrite your .vaspkit and utilities dir!)"
arch=('x86_64')
licence=('unknown')
url=https://sourceforge.net/projects/vaspkit/files/
source=('https://downloads.sourceforge.net/vaspkit/vaspkit.1.5.1.linux.x64.tar.gz')
sha1sums=(cd580116464e0b26b2e36f83aa4f26404ddfe8f3)

package(){
  install -d "${pkgdir}/usr/bin/${_swname}"
  tar xf "${srcdir}/${_swname}.linux.x64.tar.gz"
  cp -r "${srcdir}/${_swname}/"*  "${pkgdir}/usr/bin/${_swname}" -R
  cd "${pkgdir}/usr/bin/${_swname}"
  if [[ ! -e ~/.vaspkit ]]; then
   cp "${srcdir}/${_swname}/how_to_set_environment_variables" ~/.vaspkit
   echo "| The ~/.vaspkit file for vaspkit code has been added.                   |"
   echo "| Please modify ~/.vaspkit based on your account settings!               |"
  else
   echo "| The ~/.vaspkit file already existed and skipped.                       |"
  fi
  n=`grep -rin "VASPKIT_UTILITIES_PATH" ~/.vaspkit|awk  -F ':'  '{print $1}'`
  VASPKIT_UTILITIES_PATH_VARIABLE="VASPKIT_UTILITIES_PATH    /usr/bin/${_swname}/utilities"
  sed -i ""${n}"c  ${VASPKIT_UTILITIES_PATH_VARIABLE}" ~/.vaspkit
  echo "| The VASPKIT_UTILITIES_PATH variable has been updated.                  |"
  ln -s  /usr/bin/${_swname}/bin/vaspkit ${pkgdir}/usr/bin/vaspkit
}

