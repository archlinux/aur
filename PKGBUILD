# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# Bugs
# - allfontsgen, allthemesgen binaries doesn't work yet. Had to 
#   use precompiled ones.
# - Minifying of the js files sdk-all-min.js and sdk-all.js in 
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/ doesn't 
#   work yet. Had to use precompiled ones.
# - Had to replace further files:
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/common/libfont/wasm/fonts.js
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/common/libfont/js/fonts.js

pkgname=onlyoffice-documentserver
pkgver=6.0.0
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('nodejs-lts-dubnium' 'python' 'python2' 'git' 'p7zip' 'svn' 'qt5-base' 'clang' 'qt5-multimedia' 'pkg' 'ncurses5-compat-libs' 'gtk3' 'nss' 'nspr' 'libxss' 'npm' 'grunt-cli')
# python, ncurses5-compat-libs, clang, required for v8
# Nodejs-dubnium required for nodehun spellchecker
# gtk dependency for desktop editor, disabling it doesn't work yet
optdepends=('rabbitmq' 'postgresql' 'nginx')
license=('AGPL')
source=("build-tools-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/build_tools/archive/da75209683908a46f34d04db6251b1bce56af178.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/5c369464429b8cacd1fe4d9f2d221745e9b4b445.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/f69fea4018820f6624c6d4fc4b15ff003dab5dfc.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/b52b0bc6dacc61e60c1fa2d896c1d4ccb2a2e721.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/b05d71ddc07767939359b5a39f3fe1e44cdb2b3e.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/a50bb1960ff88ad5f9123c2b921aa2c9bd0f4a87.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/e761fbdf178a2a3cd31b89ea2d21ddccda4d8cac.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/7f77bfb76661dfde7f0aba45a5fcc38f7f021d27.tar.gz"
	"desktop-sdk-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/desktop-sdk/archive/7c08e4dd418d23ff0779cba4895f28967a189ad0.tar.gz"
	"document-server-integration-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/document-server-integration/archive/cadeb19eceb535edd81c1657c5da0598b04b097a.tar.gz"
	"document-builder-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/DocumentBuilder/archive/f6ef425cef5ccfe8f7d5a821f54feeb5b2c1aaae.tar.gz"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles")
sha512sums=('ce3e7852e60611d672ddf59fcf11414971c93f05e716ce6fbec8208f9bbf3a3b4289f9a9b8379de5543e2af1c55bbe4f6380987100ec580fdd009ad2adcfd162'
            '4228b2d82616dd4063adefcca1ab75a95d8cc36a1c1f2414ca42c9d1582c5bfcd7e15d28b51c40100258c82289150f119dae7d11e6d73d84993985cd46778dbe'
            '75cdc63c6d85d24a394465685775ddc5d91b11da3b40f305efb8b44c2dff45ebb8e4667cb74d73ba64676f3954e0c57ff6d014037e351873f49703dee1dd4cb1'
            '30029c53216ad07e96c893c7611571a7f3d752218476e44cedd7e5f627a62ce0cee798cd29985b7902fdb018de97bbefd7af08f61017bd32a54d965d67b929b2'
            'd7a486c2ab0e55e4cafffe632be960d94bfde0a238b0912ce2763ae138e27db55e4411cdb674e07939a02b496e1fac342ce78e5e479dc77cee6d679df2bcfb5e'
            '712215ac7f600b468db221c54947bba12f380aa3132ebdefb31c68bf3e084a59abd1248d7944bfef968adeaf3211d569fe712fededff8e9065ffb0d189e59353'
            '44b1ac73e9093e853b9dce0c0b28d80f48a6ba06dcfd372a73fde580d1535ea949a1175f6fdb8fcddfcc8967a39d6e90e14a800f388dc84a92d1acb7658a2095'
            'c7289eca8f7a58c58b8f9afb8850457203015b31a681bd560ac45d5f448d375f22a526231e11083fc48a1938e75a6f7d6bdddb9060e742219c2a54ca7a93fe45'
            '8e95e3bbd87bf0ebe71f2c72b70b20aad2381dae07b3f98f6b39b2106314f27a45b3e9f5631f1d4d3e4c15d2f568158f91c24dfaffb2733fd702d24742fc20cc'
            '232ba54bb55d24d742aacc555dd2ee2910b0f802093f74049b06cb788d8f3784ac80deba7c1d8f11a68addeec61a404f6190a1b0ea91218fae387507308269b7'
            '0f596cba62e1786c6a112cf78a39545b8905ba109358a1b81cf71cbad7b75334037326ee25633c77530e1af03e0c085a0fea5887fb5915c7a7c5e7a8d26ad2fb'
            '848074ce03328915d251db45a5475f6a2dff3b15f53b3b1dfbd702a9dc184d53aea78da1310db9c60d85a35062ce9986f37843c000f269dcaf8d624ed29e0a60'
            '71cf274868452cef92eb4729d3bfe04ce7b3dd863aee8e7395cf166296206b07abb60756e09911395badbea1965eea4a9fa7595dba7f9bc1c7ad4b8158ac1263'
            '3df1f5339b394eef1b27317f5d0e7786d2cb8dbbd13cddb22047567c3703f384d95f092fc34ce3031aeb895f013d7c0686ce968e1fae7f1f24473c1a6615f7ad'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"
options=('!strip')

prepare() {
  cd "${srcdir}"

  # Unfortunately, v8 depot_tools still requires python2
  # Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  # Rename source directories
  for dir in "core" "core-fonts" "dictionaries" "sdkjs" "sdkjs-plugins" "server" "web-apps" "desktop-sdk" "document-server-integration" "DocumentBuilder"
  do
    rm -rf "${dir}"
    find . -maxdepth 1 -type d -regex "./${dir}-[a-z0-9]*" -exec mv '{}' ${dir} \;
  done

  # Configuration for build-tools
  cd "build_tools-da75209683908a46f34d04db6251b1bce56af178"
  ./configure.py --branch master --module server --update 0 --qt-dir /usr/include/qt

  # Unsure how to fix path to QT-dir
  sed -i '45i\ \ \ \ qt_dir = ""' scripts/build.py

  # Fix config file paths
  sed -i 's|/var/www/onlyoffice|/usr/share/webapps/onlyoffice|g' "${srcdir}/server/Common/config/production-linux.json"
  sed -i 's|/etc/onlyoffice/documentserver|/etc/webapps/onlyoffice/documentserver|g' "${srcdir}/server/Common/config/production-linux.json"

  # Ignore grunt warnigns otherwise compilation will fail
  sed -i '78d' "${srcdir}/build_tools-da75209683908a46f34d04db6251b1bce56af178/scripts/build_js.py"
  sed -i '78i\ \ return base.cmd_in_dir(directory, "grunt", ["--force"] +  params)' "${srcdir}/build_tools-da75209683908a46f34d04db6251b1bce56af178/scripts/build_js.py"
}

build() {
  cd "${srcdir}/build_tools-da75209683908a46f34d04db6251b1bce56af178"

  export PATH="${srcdir}/path:$PATH"
  ./make.py
}

package() {
  install -d "${pkgdir}/usr/share/webapps/onlyoffice"
  install -d "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js"
  install -d "${pkgdir}/var/lib/onlyoffice/documentserver"
  cp -r "${srcdir}/build_tools-da75209683908a46f34d04db6251b1bce56af178/out/linux_64/onlyoffice/documentserver" "${pkgdir}/usr/share/webapps/onlyoffice/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/default.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/production-linux.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/log4js/production.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js/"

  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
