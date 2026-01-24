# Maintainer: rechie <gaoruiqi@kylinos.cn>

pkgbase=libkysdk-base
pkgname=libkysdk-base
pkgver=3.0.1.0
pkgrel=4
pkgdesc="kylin system develpoer kit - base kit"
arch=('x86_64')
license=('GPL-3.0-only')
url="https://gitee.com/rechie1995/libkysdk-base"
depends=(
	'dbus'
	'glib2'
	'glibc'
	'yaml-cpp'
	'qt6-base'
	'openssl'
	'sqlite'
	'systemd-libs'
	'gcc-libs'
	'gtk3'
  'python'
  'python-dbus'
  'python-watchdog'
  'python-yaml'
  'python-gobject')
makedepends=(
	'git'
	'cmake'
	'gcc'
  'nlohmann-json'
        )
groups=('ukui')
_commit=bfd651078a74302d99171f1afa60f53ad8235cc0
source=(
	"git+https://gitee.com/rechie1995/libkysdk-base.git?#commit=$_commit")


build() {
  cd "$srcdir/${pkgbase}"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
  make
}

package() {
  cd "$srcdir/$pkgbase"  
  # library
  mkdir -p $pkgdir/usr/ && cp -r lib/ $pkgdir/usr/
  # pkgconfig
  install -Dm644 -t $pkgdir/usr/lib/pkgconfig/ development-files/*.pc
  install -Dm644 -t $pkgdir/etc/ld.so.conf.d/ development-files/kysdk-base.conf 
  # manpages
  install -Dt $pkgdir/usr/share/man/man3 man/*/*.3
  # libkysdk-conf2-dev
  install -Dm644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/conf2/api/libkysettings.h
  # libkysdk-conf2-tools
  install -Dm755 -t $pkgdir/usr/bin/ src/conf2/tools/*2yaml
  install -Dm755 -t $pkgdir/usr/bin/ src/conf2/tools/health-check
  install -Dm755 -t $pkgdir/etc/bash_completion.d/ src/conf2/tools/kconf2-completion.sh
  install -Dm755 -t $pkgdir/usr/share/kysdk/kysdk-base src/conf2/tools/kconf2-editor
  install -Dm755 -t $pkgdir/usr/bin/ bin/kconf2
  # libkysdk-conf2
  ## system bus
  install -Dm755 -t $pkgdir/usr/share/kysdk/kysdk-base/ src/conf2/service/conf2Utils.py
  install -Dm755 -t $pkgdir/usr/share/kysdk/kysdk-base/ src/conf2/service/conf2-system.py
  install -Dm644 -t $pkgdir/etc/dbus-1/system.d/ src/conf2/service/kysdk-conf2.conf
  install -Dm644 -t $pkgdir/usr/lib/systemd/system/ src/conf2/service/kysdk-conf2.service
  install -Dm644 -t $pkgdir/etc/kylin-config/ src/conf2/configs/conf2.yaml
  ## session bus
  install -Dm755 -t $pkgdir/usr/share/kysdk/kysdk-base/ src/conf2/service/conf2-session.py
  install -Dm755 -t $pkgdir/etc/xdg/autostart/ src/conf2/service/kysdk-conf2.desktop
  ## conf2 compile
  install -Dm755 -t $pkgdir/usr/bin/ bin/conf2-compile
  install -Dm644 -t $pkgdir/usr/lib/systemd/system/ src/conf2/configs/conf2-compile.service
  ## dbus control
  install -Dm644 -t $pkgdir/etc/kylin-config/basic/ src/conf2/configs/com.kylin.kysdk.conf2.yaml
  ## sync system bus
  install -Dm755 -t $pkgdir/usr/bin/ bin/conf2-sync-system
  install -Dm644 -t $pkgdir/etc/dbus-1/system.d/ src/conf2/sync-config/com.kylin.kysdk.SyncConfig.conf
  install -Dm644 -t $pkgdir/usr/lib/systemd/system/ src/conf2/sync-config/com.kylin.kysdk.SyncConfig.service
  ## sync session bus
  install -Dm755 -t $pkgdir/usr/bin/ bin/conf2-sync-session
  install -Dm755 -t $pkgdir/etc/xdg/autostart/ src/conf2/sync-config/com.kylin.kysdk.SyncConfig.desktop
  # libkysdk-config-dev
  install -Dt $pkgdir/usr/include/kysdk/kysdk-base/ src/config/libkyconf.h
  # libkysdk-diagnostics-dev
  install -Dt $pkgdir/usr/include/kysdk/kysdk-base/ src/diagnostics/libkydiagnostics.h
  # libkysdk-gsetting-dev
  install -Dt $pkgdir/usr/include/kysdk/kysdk-base/ src/gsettings/libkygsetting.h
  # libkysdk-log-dev
  install -Dt $pkgdir/usr/include/kysdk/kysdk-base/ src/log/libkylog.h
  # libkysdk-log
  install -D -m644 -t $pkgdir/etc/kysdk/kysdk-base/ src/log/kylog-default.conf
  install -D -m644 -t $pkgdir/etc/kysdk/kysdk-base/ src/log/kylog-rotate-default
  # libkysdk-timer-dev
  install -Dt $pkgdir/usr/include/kysdk/kysdk-base/ src/timer/libkytimer.h
  # libkysdk-utils-dev
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/sdkmarcos.h 
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/kerr.h
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/cstring-extension.h
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/kyutils.h
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/data-structure/linklist/skip_linklist/skip_linklist.h 
  install -D -m644 -t $pkgdir/usr/include/kysdk/kysdk-base/ src/utils/data-structure/linklist/listdata.h

}
sha256sums=('b38115774333443d850ff88ad88343e49d5412e7ec9bdcf9480b375ddf100518')
