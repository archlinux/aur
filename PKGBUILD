# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: hl037 <hl037 dot prog at gmail dot com>
# Contributor: d1t2 <dieterplex at gmail dot com>

pkgname='eclipse-testng'
pkgver='6.9.10'
pkgdate='201512240000'
pkgrel='1'
pkgdesc='A testing framework inspired from JUnit and NUnit'
arch=('any')
url='http://testng.org/'
license=('APACHE')
depends=('eclipse>=4.5.0')
#_url="https://github.com/cbeust/testng-eclipse/raw/master/testng-eclipse-update-site"
_url='http://beust.com/eclipse/'
_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
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

sha256sums=('f66093bbc84fd457dc863b40aafb5c85f874592ca74bedf789c7e1a90f84a11f'
            '7ea3fa3b164d64f50fc459650208bec08d71438e4e27533872e1911a0b0fe3f3'
            'ba0ef5a84629946a7ffeab44e97ff9e0a1d0ed17f23821350dab386f7d275f7a'
            'fdfb8e6f6a9c5d59215812b0e7cd60f9b3c567ad98f8bb3c0cb054e88900714d')

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
