# Maintainer: Dieter Hsu <dieterplex@gmail.com>
pkgname=eclipse-propedit-hyperlink
pkgver=2.0.0
pkgrel=1
pkgdesc="Properties Editor Hyperlink for Eclipse"
arch=('i686' 'x86_64')
url="http://propedit.sourceforge.jp"
license=('EPL')
depends=('eclipse>=3.7' 'eclipse-propedit>=6.0.0')
_url="http://propedit.sourceforge.jp/eclipse/updates"

source=(
    "features_jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar::${_url}/features/jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar::${_url}/plugins/jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar")
noextract=(
    "features_jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit.hyperlink_${pkgver}.jar")
md5sums=(
    '2275d94bf1cec05588050f7529e53680'
    'e60798a5a9cebce305ab3eb8ca55f413')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/propedit-hyperlink/eclipse
  install -dm755 ${_dest}/plugins

  for url in ${source[@]}
  do
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    if [ ${_type} == 'features' ]; then
        install -dm755 ${_dest}/features/${_file/.jar}
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/features_${_file} || return 1
    else
        install -m644 ${srcdir}/plugins_${_file} ${_dest}/plugins/${_file}
    fi
  done
}
