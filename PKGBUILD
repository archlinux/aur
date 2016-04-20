# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# TODO Add serverAgent stuff to the package.
pkgname=jmeter-plugins
pkgver=1.4.0
#_saver=2.2.1
pkgrel=1
pkgdesc="Custom set of plugins for Apache JMeter."
arch=('x86_64' 'i686')
url=http://jmeter-plugins.org/
license=(APACHE)
makedepends=('unzip')
depends=('java-runtime>=6' 'jmeter>=2.10')
optdepends=('zsh-completions: auto-completion for the jmeter-plugins command on Zsh')
options=(!strip)

_dl_url=http://jmeter-plugins.org/downloads/file
source=(
  "${_dl_url}/JMeterPlugins-Standard-${pkgver}.zip"
# "${_dl_url}/ServerAgent-${_saver}.zip"
  "${_dl_url}/JMeterPlugins-Extras-${pkgver}.zip"
  "${_dl_url}/JMeterPlugins-ExtrasLibs-${pkgver}.zip"
# "${_dl_url}/JMeterPlugins-Hadoop-${pkgver}.zip"
# "${_dl_url}/JMeterPlugins-WebDriver-${pkgver}.zip"
)
sha256sums=('3f740bb9b9a7120ed72548071cd46a5f92929e1ab196acc1b2548549090a2148'
            'de35e653250882268aa24d011ec0f2afbc13e1c552fbb676c67515bc80ef3194'
            '81d600a5bda6fdb362573d55c11208b2635728a2c18b7f647b9c7413c0f33ef3')

noextract=(
  "JMeterPlugins-Standard-${pkgver}.zip"
# "ServerAgent-${_saver}.zip"
  "JMeterPlugins-Extras-${pkgver}.zip"
  "JMeterPlugins-ExtrasLibs-${pkgver}.zip"
# "JMeterPlugins-Hadoop-${pkgver}.zip"
# "JMeterPlugins-WebDriver-${pkgver}.zip"
)

prepare() {
  rm -rf ${srcdir}/{Standard,Extras,ExtrasLibs,WebDriver,Hadoop,ServerAgent}
  mkdir ${srcdir}/{Standard,Extras,ExtrasLibs,WebDriver,Hadoop,ServerAgent}
  cd ${srcdir}/Standard
  unzip ${srcdir}/JMeterPlugins-Standard-${pkgver}.zip
  cd ${srcdir}/Extras
  unzip ${srcdir}/JMeterPlugins-Extras-${pkgver}.zip
  cd ${srcdir}/ExtrasLibs
  unzip ${srcdir}/JMeterPlugins-ExtrasLibs-${pkgver}.zip
# cd ${srcdir}/WebDriver
# unzip ${srcdir}/JMeterPlugins-WebDriver-${pkgver}.zip
# cd ${srcdir}/Hadoop
# unzip ${srcdir}/JMeterPlugins-Hadoop-${pkgver}.zip
# cd ${srcdir}/ServerAgent
# unzip ${srcdir}/ServerAgent-${_saver}.zip
}

package() {
  msg2 "Install libraries ..."
  install -Dm644 ${srcdir}/Standard/lib/ext/CMDRunner.jar \
                 ${pkgdir}/opt/jmeter/lib/ext/CMDRunner.jar
  install -Dm644 ${srcdir}/Standard/lib/ext/JMeterPlugins-Standard.jar \
                 ${pkgdir}/opt/jmeter/lib/ext/JMeterPlugins-Standard.jar

  install -Dm644 ${srcdir}/Extras/lib/ext/JMeterPlugins-Extras.jar \
                 ${pkgdir}/opt/jmeter/lib/ext/JMeterPlugins-Extras.jar

  install -Dm644 ${srcdir}/ExtrasLibs/lib/ext/JMeterPlugins-ExtrasLibs.jar \
                 ${pkgdir}/opt/jmeter/lib/ext/JMeterPlugins-ExtrasLibs.jar

# install -Dm644 ${srcdir}/WebDriver/lib/ext/JMeterPlugins-WebDriver.jar \
#                ${pkgdir}/opt/jmeter/lib/ext/JMeterPlugins-WebDriver.jar
# mv ${srcdir}/WebDriver/lib/*.jar ${pkgdir}/opt/jmeter/lib/

# install -Dm644 ${srcdir}/Hadoop/lib/ext/JMeterPlugins-Hadoop.jar \
#                ${pkgdir}/opt/jmeter/lib/ext/JMeterPlugins-Hadoop.jar
# mv ${srcdir}/Hadoop/lib/*.jar ${pkgdir}/opt/jmeter/lib/

# install -Dm644 ${srcdir}/ServerAgent/CMDRunner.jar \
#                ${pkgdir}/opt/jmeter/lib/ext/CMDRunner.jar
# install -Dm644 ${srcdir}/ServerAgent/ServerAgent.jar \
#                ${pkgdir}/opt/jmeter/lib/ext/ServerAgent.jar
# install -Dm755 ${srcdir}/ServerAgent/startAgent.sh \
#                ${pkgdir}/opt/jmeter/lib/ext/startAgent.sh
# mv ${srcdir}/ServerAgent/lib/*.jar ${pkgdir}/opt/jmeter/lib/

# if [ "$CTYPE" = "i686" ]; then
#   mv ${srcdir}/ServerAgent/lib/libsigar-x86-linux.so ${pkgdir}/opt/jmeter/lib/
# else
#   mv ${srcdir}/ServerAgent/lib/libsigar-amd64-linux.so ${pkgdir}/opt/jmeter/lib/
# fi

# rm ${pkgdir}/opt/jmeter/lib/logkit-2.0.jar
# rm ${pkgdir}/opt/jmeter/lib/xercesImpl-2.9.1.jar

  msg2 "Install documentation ..."
  install -Dm644 ${srcdir}/Standard/README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 ${srcdir}/Extras/README ${pkgdir}/usr/share/doc/${pkgname}/README_Extras
  install -Dm644 ${srcdir}/ExtrasLibs/README ${pkgdir}/usr/share/doc/${pkgname}/README_ExtrasLibs
# install -Dm644 ${srcdir}/WebDriver/README ${pkgdir}/usr/share/doc/${pkgname}/README_WebDriver
# install -Dm644 ${srcdir}/Hadoop/README ${pkgdir}/usr/share/doc/${pkgname}/README_Hadoop

  msg2 "Install licenses ..."
  install -Dm644 ${srcdir}/Standard/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/Extras/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_Extras
  install -Dm644 ${srcdir}/ExtrasLibs/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ExtrasLibs
# install -Dm644 ${srcdir}/WebDriver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_WebDriver
# install -Dm644 ${srcdir}/Hadoop/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_Hadoop
# install -Dm644 ${srcdir}/ServerAgent/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ServerAgent

  msg2 "Install executables ..."
  install -Dm755  ${srcdir}/Standard/lib/ext/JMeterPluginsCMD.sh ${pkgdir}/opt/jmeter/bin/JMeterPluginsCMD.sh
# install -Dm755  ${srcdir}/ServerAgent/startAgent.sh ${pkgdir}/opt/jmeter/bin/startAgent.sh
}

# vim:set ts=2 sw=2 et:
