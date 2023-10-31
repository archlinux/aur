# Maintainer: effeffe <filippo dot falezza at outlook dot it>
pkgname=lise-app
pkgver=16.17.2
arch=('x86_64')
pkgrel=1
pkgdesc='Lise++ Rare Isotope Beam Production Package'
url='https://lise.nscl.msu.edu/lise.html'
OPTIONS=!strip
_runname="${pkgname}_${pkgver}.run"
source=(
  "https://lise.nscl.msu.edu/download/Linux/${_runname}"
  "https://lise.nscl.msu.edu/picture/emblem_little.gif"
  "lise-app.desktop"
  "lise-app.sh"
)
sha256sums=(
  '7fe5ef5e40fb2324a4b2e2f0f3e91c1e36bfa9f7bcf943d39f1f3ca27f74ddbe'
  '1e3312bc55da1266b9870b2bcd133d2fc6c68117ffabfc814abce38cfa3ddc64'
  '7aa0046fbc68fdc28d4b59c68baf56f028de338edf408559fca336e3394b950e'
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
  #install -m755 ${srcdir}/lise-app/LISE++ ${pkgdir}/opt/${pkgname}/lise++
  ln -s /opt/${pkgname}/LISE++ ${pkgdir}/opt/${pkgname}/lise++
  install -m755 -d ${pkgdir}/etc/profile.d
  install -D -m755 ${srcdir}/lise-app.sh ${pkgdir}/etc/profile.d/
  install -D -m755 ${srcdir}/lise-app.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
