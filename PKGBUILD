# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-constraint-layout
pkgver=1.0.2
pkgrel=2
pkgdesc='ConstraintLayout for Android (includes solver)'
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
depends=('android-sdk')
provides=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/com.android.support.constraint-constraint-layout-${pkgver}.zip"
        "https://dl.google.com/android/repository/com.android.support.constraint-constraint-layout-solver-${pkgver}.zip"
        "constraint-layout.xml"
        "constraint-layout-solver.xml")
sha1sums=('3d9688a50fe0ed7348275f85d1b02278f616d8a4'
          '96d7ff669f0e808e9833b2c2e320702826ccc8be'
          'SKIP'
          'SKIP')

package() {
  _dir_layout="${pkgdir}/opt/android-sdk/extras/m2repository/com/android/support/constraint/constraint-layout"
  _dir_solver="${_dir_layout}-solver"

  mkdir -p "${_dir_layout}/" "${_dir_solver}/"

  cp -dpr --no-preserve=ownership "${srcdir}/constraintlayout" "${_dir_layout}/${pkgver}"
  cp -dpr --no-preserve=ownership "${srcdir}/solver" "${_dir_solver}/${pkgver}"
  cp -dpr --no-preserve=ownership "${srcdir}/constraint-layout.xml" "${_dir_layout}/${pkgver}/package.xml"
  cp -dpr --no-preserve=ownership "${srcdir}/constraint-layout-solver.xml" "${_dir_solver}/${pkgver}/package.xml"

  chmod -R ugo+rX "${pkgdir}/opt"
}
