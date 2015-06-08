# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: hl037 <hl037 dot prog at gmail dot com>
# Contributor: d1t2 <dieterplex at gmail dot com>

pkgname='eclipse-testng'
pkgver='6.8.5'
pkgdate='20130517_2211'
pkgrel='1'
pkgdesc='A testing framework inspired from JUnit and NUnit'
arch=('any')
url='http://testng.org/'
license=('APACHE')
depends=('eclipse>=3.4')
#_url="https://github.com/cbeust/testng-eclipse/raw/master/testng-eclipse-update-site"
_url="http://beust.com/eclipse-old/eclipse-$pkgver.$pkgdate"
_path="org.testng.eclipse_$pkgver.$pkgdate"
source=(
    artifacts.jar::"$_url/artifacts.jar"
    content.jar::"$_url/content.jar"
    features.jar::"$_url/features/$_path.jar"
    plugins.jar::"$_url/plugins/$_path.jar")
#noextract=(${source[@]##*/})
noextract=(artifacts.jar content.jar features.jar plugins.jar)

sha1sums=('ca71c805778833145ec9350a4e18ac2b39ac4494'
          '17c2f8110805bc7dc4d741643590c332d5b45c75'
          '84474455723c830f221e473cd478865a23c1dc17'
          '6d7fddc2a0c78250841acecbdfe373feecaae52d')

package() {
  _dest=$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  install -dm755 $_dest
  install -Dm644 artifacts.jar $_dest
  install -Dm644 content.jar $_dest

  for jar in 'features' 'plugins'; do
      install -Dm644 $srcdir/$jar.jar $_dest/$jar/$_path.jar
  done
}

