# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: hl037 <hl037 dot prog at gmail dot com>
# Contributor: d1t2 <dieterplex at gmail dot com>

pkgname='eclipse-testng'
pkgver='6.10.0'
pkgdate='201612030230'
pkgrel='1'
pkgdesc='A testing framework plugin for Eclipse IDE inspired by JUnit and NUnit'
arch=('any')
url='http://testng.org/'
license=('APACHE')
depends=('eclipse>=4.5.0')
#_url="https://github.com/cbeust/testng-eclipse/raw/master/testng-eclipse-update-site"
_url="https://dl.bintray.com/testng-team/testng-eclipse-release/updatesites/$pkgver.$pkgdate"
_dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"
_path="org.testng.eclipse_$pkgver.$pkgdate"
_path2features="org.testng.eclipse.maven.feature_$pkgver.$pkgdate"
_path2plugins="org.testng.eclipse.maven_$pkgver.$pkgdate"
source=(
    features.jar::"$_url/features/$_path.jar"
    plugins.jar::"$_url/plugins/$_path.jar"
    features2.jar::"$_url/features/$_path2features.jar"
    plugins2.jar::"$_url/plugins/$_path2plugins.jar"
)
noextract=(features.jar plugins.jar features2.jar plugins2.jar)

sha256sums=('49abb6b209ee6d755ae083a6433e580b3c1d4c7e447e4c368f9a1fdcd48d2b55'
            'e39c3b084c881ee995debcc2dde33d2b06755c81a68e5ea42c6135ef6e849e83'
            '464afaa483badcaed8ad7b27733b64e82b7ba3794716871f09d4c67258ca0cb6'
            '90b010bb2b86dab1fb8ce0f91c2a4e6db0a27b0f914fb6d13813bc9c843097ba')

package() {
  _dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse

  install -dm755 $_dest

  for jar in 'plugins'; do
      install -Dm644 $srcdir/$jar.jar $_dest/$jar/$_path.jar
  done
  install -Dm644 $srcdir/features2.jar $_dest/features/$_path2features.jar
  install -Dm644 $srcdir/plugins2.jar $_dest/plugins/$_path2plugins.jar
  install -dm755 ${_dest}/features/$_path
  cd ${_dest}/features/$_path
  jar xf ${srcdir}/features.jar || return 1
}
