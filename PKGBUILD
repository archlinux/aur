# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Forrest L <cybercyst at gmail com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Marcin "eXine" M. <exine@jun.pl>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Antonio Santos <asantos at gmail dot com>

pkgname=eclipse-android
pkgver=23.0.6
_sdkver=24.1.2
pkgrel=1
pkgdesc='Eclipse plugin for Android'
url='https://developer.android.com/sdk/eclipse-adt.html'
license=('Apache' 'BSD' 'EPL' 'LGPL')
arch=('any')
depends=("android-sdk>=r${_sdkver}" 'java-environment>=6' 'eclipse>=3.7.2' 'eclipse-wtp')
options=('!strip')
source=("http://dl.google.com/android/ADT-${pkgver}.zip" "LICENSE.kxml2")
sha1sums=('1ce14cf4f6e3bf8e4213dd22cfd14c2237c8c22d'
          'c0a96dc032bb53e2921200c85f5cf650e49878e9')

package() {
  _dest="${pkgdir}/usr/share/eclipse/dropins/android/eclipse"

  cd "${srcdir}"

  # Features
  for _f in features/*.jar; do
    _dir="${_dest}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done

  # Plugins
  for _p in plugins/*.jar; do
    install -Dm644 "${_p}" "${_dest}/${_p}"
  done

  install -D -m644 LICENSE.kxml2 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.kxml2"
}
