# Maintainer: Dieter Hsu <dieterplex@gmail.com>
pkgname=eclipse-m2e-extras
pkgver=0.15.0
_pkgver=0.15.0.201202141716
pkgrel=2
pkgdesc="The Maven Integration for Eclipse extra components provide support for additional tools."
arch=('i686' 'x86_64')
url="https://github.com/sonatype/m2eclipse-extras"
license=('EPL')
depends=('eclipse>=3.6' 'eclipse-m2e>=1.0')
_url="http://repository.sonatype.org/content/repositories/forge-sites/m2e-extras/${pkgver}/N/${_pkgver}"

source=(
    "${_url}/artifacts.jar"
    "${_url}/content.jar"
    "${_url}/features/org.sonatype.m2e.antlr.feature_${_pkgver}.jar"
    "${_url}/features/org.sonatype.m2e.buildhelper.feature_${_pkgver}.jar"
    "${_url}/features/org.sonatype.m2e.mavenarchiver.feature_${_pkgver}.jar"
    "${_url}/features/org.sonatype.m2e.modello.feature_${_pkgver}.jar"
    "${_url}/features/org.sonatype.m2e.plexus.annotations.feature_${_pkgver}.jar"
    "${_url}/features/org.sonatype.m2e.sisuindex.feature_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.antlr_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.buildhelper_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.mavenarchiver_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.modello_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.plexus.annotations_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.sisuindex_${_pkgver}.jar")
noextract=(
    "artifacts.jar"
    "content.jar"
    "org.sonatype.m2e.antlr.feature_${_pkgver}.jar"
    "org.sonatype.m2e.buildhelper.feature_${_pkgver}.jar"
    "org.sonatype.m2e.mavenarchiver.feature_${_pkgver}.jar"
    "org.sonatype.m2e.modello.feature_${_pkgver}.jar"
    "org.sonatype.m2e.plexus.annotations.feature_${_pkgver}.jar"
    "org.sonatype.m2e.sisuindex.feature_${_pkgver}.jar"
    "org.sonatype.m2e.antlr_${_pkgver}.jar"
    "org.sonatype.m2e.buildhelper_${_pkgver}.jar"
    "org.sonatype.m2e.mavenarchiver_${_pkgver}.jar"
    "org.sonatype.m2e.modello_${_pkgver}.jar"
    "org.sonatype.m2e.plexus.annotations_${_pkgver}.jar"
    "org.sonatype.m2e.sisuindex_${_pkgver}.jar")

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/m2e-extras/eclipse
  install -dm755 ${_dest}/plugins

  install -Dm644 artifacts.jar ${_dest} || return 1
  install -Dm644 content.jar ${_dest} || return 1

  for url in ${source[@]:2:13}
  do 
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    #install -Dm644 ${_file} ${_dest}/${_type}/${_file} || return 1
    if [ ${_type} == 'features' ]; then
        install -dm755 ${_dest}/features/${_file/.jar} 
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/${_file} || return 1
    else
        install -Dm644 ${srcdir}/${_file} ${_dest}/plugins
    fi
  done     
}
# vim:set ts=4 sw=4 et:

md5sums=('943d549f8a7855d2cd700be69c79afb9'
         'c4f763075b66c7ce4b8c860728a3d5f4'
         'd99b97750f1bda752875c487e2264073'
         '4ec31e93e6165a7c2bb37fdf16154b74'
         '7954246779cc58a982332e94ebf5505d'
         'cb84be8a893c9ec49d25d8f962ab657c'
         'b9addb772b1d024ed7e7bfe897450c6a'
         '8c66cbd2843a5872b9b4e33bf92c0583'
         'd111f6b692302227bf98f9f87c780cee'
         '185170d9509d38a9730040c7ea02be24'
         '1ef8aff9e108af3ff2ca6b2753b1eebc'
         'a4161e79897bac28c5309ea1062342a0'
         '561d0342740b63ea7059a1d4db8e74e3'
         '259c4b2e24333c3448bb8a2ddd857a6b')
