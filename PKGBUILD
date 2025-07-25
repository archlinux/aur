# Maintainer: effeffe <filippo dot falezza at outlook dot it>
pkgname=lise-app
pkgver=17.12.7
arch=('x86_64')
pkgrel=1
pkgdesc='Lise++ Rare Isotope Beam Production Package'
url='https://lise.nscl.msu.edu/lise.html'
OPTIONS=!strip
_runname="${pkgname}_v${pkgver}.run"
source=(
  "https://lise.nscl.msu.edu/download/Linux/${_runname}"
  "https://lise.nscl.msu.edu/picture/emblem_little.gif"
  "lise-app.desktop"
  "lise-app.sh"
)
sha256sums=(
  '07780df10051a027cdb3f6add2ed812c3f92cb6dd80344d388a02a567b61b825'
  '1e3312bc55da1266b9870b2bcd133d2fc6c68117ffabfc814abce38cfa3ddc64'
  'b6c15ade3c761682614e3e2a62d95e70c94c74cafde26ede1e236ca62240c928'
  '9c39f463aa7da650e7017533a9c78e6f34d653b1d382cb5e05b037ea6b8a223e'
)

build()
{
  echo ${srcdir}
  chmod +x ./${_runname}
  ./${_runname} --noexec
  cp emblem_little.gif lise-app/
}
package()
{
  cd ${srcdir}
  install -m755 -d ${pkgdir}/opt/${pkgname}
  find lise-app -type f -exec install -D -m755 "{}" "${pkgdir}/opt/{}" \;
  ln -s /opt/${pkgname}/LISE++ ${pkgdir}/opt/${pkgname}/lise++
  install -m755 -d ${pkgdir}/etc/profile.d
  install -D -m755 ${srcdir}/lise-app.sh ${pkgdir}/etc/profile.d/
  install -D -m755 ${srcdir}/lise-app.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
