# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-mylyn-googlecode
pkgver=0.1.0
pkgrel=2
pkgdesc="A Mylyn connector for Google Code"
url="http://code.google.com/p/googlecode-mylyn-connector/"
arch=('any')
license=('EPL')
depends=('eclipse-mylyn')
changelog=$pkgname.changelog
source=(http://knittig.de/googlecode-mylyn-connector/update/features/com.googlecode.mylyn_0.1.0.201005250323NGT.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/com.googlecode.mylyn.core_0.1.0.201005250323NGT.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/com.google.gdata.projecthosting_1.40.3.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/org.jsr305_0.1.0.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/com.googlecode.mylyn.ui_0.1.0.201005250323NGT.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/com.google.collect_1.0.0.rc1.jar
        http://knittig.de/googlecode-mylyn-connector/update/plugins/com.google.gdata.core_1.40.4.jar)
noextract=('com.googlecode.mylyn_0.1.0.201005250323NGT.jar'
           'com.googlecode.mylyn.core_0.1.0.201005250323NGT.jar'
           'com.google.gdata.projecthosting_1.40.3.jar'
           'org.jsr305_0.1.0.jar'
           'com.googlecode.mylyn.ui_0.1.0.201005250323NGT.jar'
           'com.google.collect_1.0.0.rc1.jar'
           'com.google.gdata.core_1.40.4.jar')
md5sums=('7af8dba6d5312dbc9d2f971f1843f648'
         '28df517f1f6c348d05731b328b9750bd'
         'f8d4084491a722f73ad0483accca4faf'
         '98ed866edd5f41e3685275cc8c7f631a'
         '85163e15d5e476dd86ed4a44a021b77e'
         '1b80f544d2fc7aa74777a22b9cfdf7a8'
         '84b85eb3091bd5101ff75f88cded12c6')
sha256sums=('0714cb8b230f36b26584f1501e6cd4535a26455c80bb0984212fcb67619c484d'
            'f6bbef817ca9ef66ee4c9b9bb1747c62391de8f3109cfe8c9d2f55d86ce8743f'
            '7c37aa4e8a62b0347a4815cee16b2951ccc56971bfe6e9fcb82c543d66bf5b32'
            '770c2365c8ebae3d2a5002349f28bee60b24d3fe120c37ff946b870596a0e4fe'
            'dea37455f934f3a5314d186b1ccea296824ad9392aa48af7de25ec4e278efc61'
            '8825f0184389d1463ad7771fc79f41f0800ca805fc874f7ab6d61a1ccdcfcb3a'
            'cf668835f278b45b648bceb49c1e415306a2c1655687a127462cc575b284022a')

build() {

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  
  cd ${srcdir}
  
  mkdir features/ || return 1
  cp $startdir/com.googlecode.mylyn_0.1.0.201005250323NGT.jar features/ || return 1
  
  mkdir plugins/ || return 1
  cp $startdir/com.googlecode.mylyn.core_0.1.0.201005250323NGT.jar plugins/ || return 1
  cp $startdir/com.google.gdata.projecthosting_1.40.3.jar plugins/ || return 1
  cp $startdir/org.jsr305_0.1.0.jar plugins/ || return 1
  cp $startdir/com.googlecode.mylyn.ui_0.1.0.201005250323NGT.jar plugins/ || return 1
  cp $startdir/com.google.collect_1.0.0.rc1.jar plugins/ || return 1
  cp $startdir/com.google.gdata.core_1.40.4.jar plugins/ || return 1
	
  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done

}
