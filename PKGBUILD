# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_plugin=captcha
pkgname=squirrelmail-plugin-${_plugin}
pkgver=1.2.3
pkgrel=2
_squirrelver=1.2.9
_squirrelver2=1.4.17
pkgdesc="Plugin for squirrelmail. This plugin places a CAPTCHA input on the login screen."
license=('GPLv2')
arch=(any)
url="http://www.squirrelmail.org/plugin_view.php?id=263"
depends=("squirrelmail>=${_squirrelver2}"
	'php-gd'
	)
backup=(srv/http/squirrelmail/plugins/${_plugin}/config.php)
source=(http://www.squirrelmail.org/plugins/${_plugin}-${pkgver}-${_squirrelver}.tar.gz)
md5sums=('b4a15b2dba938a1f7e477a0627cb640b')

build() {
  # install
  local dstdir=$pkgdir/srv/http/squirrelmail/plugins || return 1
  install -d ${dstdir} || return 1
  cp -R $srcdir/${_plugin} ${dstdir} || return 1
  cp ${dstdir}/${_plugin}/config_example.php ${dstdir}/${_plugin}/config.php || return 1
  msg2 "setting backend to quickcaptcha"
  sed -i "s|\$captcha_backend = '';|\$captcha_backend = 'quickcaptcha';|g" ${dstdir}/${_plugin}/config.php
}
