# Maintainer: Dieter Hsu <dieterplex@gmail.com>
pkgname=eclipse-propedit
pkgver=6.0.0
pkgrel=1
pkgdesc="Properties Editor for Eclipse"
arch=('i686' 'x86_64')
url="http://propedit.sourceforge.jp"
license=('EPL')
depends=('eclipse>=3.7')
_url="http://propedit.sourceforge.jp/eclipse/updates"

source=(
    "features_jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar::${_url}/features/jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar"
    "features_jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar::${_url}/features/jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar::${_url}/plugins/jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar::${_url}/plugins/jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar")
noextract=(
    "features_jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar"
    "features_jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit_${pkgver}.jar"
    "plugins_jp.gr.java_conf.ussiy.app.propedit.nl_${pkgver}.jar")
md5sums=(
    '42ab1059008c39aca9cc49a494bb6aba'
    'd020f5473227927a8679a58e988e571f'
    '87a9f90140d3e450c8af1df1593e4a8e'
    '0700dc64a1b21bcaf31dcda46023f169')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/propedit/eclipse
  install -dm755 ${_dest}/plugins

  for url in ${source[@]}
  do
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    if [ ${_type} == 'features' ]; then
    echo ${_file}
        install -dm755 ${_dest}/features/${_file/.jar}
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/features_${_file} || return 1
    else
        install -m644 ${srcdir}/plugins_${_file} ${_dest}/plugins/${_file}
    fi
  done
}
