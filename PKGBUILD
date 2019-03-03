# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=budgie-screensaver
_pkgname=gnome-screensaver
pkgver=3.6.1
pkgrel=1
pkgdesc="Ubuntu Budgie's fork of GNOME's legacy screensaver"
arch=('x86_64')
license=('GPL')
url="https://wiki.gnome.org/Projects/GnomeScreensaver"
backup=(etc/pam.d/gnome-screensaver)
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
conflicts=('gnome-screensaver')
source=(https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
       gnome-screensaver.pam
       move-desktop-file.patch
       fix-autoconf.patch
       fix-systemd-support.patch
       lock_screen_on_suspend.patch
       lightdm_switch_user.patch
       recenter.patch
       03_fix_ltsp-fading.patch
       05_dbus_service.patch
       10_legacy_scrsvr_inhibit.patch
       13_nvidia_gamma_fade_fallback.patch
       14_no_fade_on_user_switch.patch
       15_dont_crash_on_no_fade.patch
       16_dont_crash_in_kvm.patch
       25_fix_lock_command.patch
       29_handle_expired_creds.patch
       move-not-nuke.patch
       allow-replacement
       18_unity_dialog_layout.patch
       32_input_sources_switcher.patch
       24_use_user_settings.patch
       17_remove_top_panel.patch
       33_budgie_support.patch)
       
sha256sums=('f39b78d4f7fed748c7f0a31d694112fb907c6d3c4e63db22eb858df07e962cd0'
            'b6ea9e2eb586d94bcabb617a8f1c2958111df87afdbb51f645882bccdc15cbda'
            '4bb96f62aa069c83b629204a79a3f63b146bcaf773569aee8b5dd23fbcd88974'
            'c4da9c18b543ecbc781c1f103321b324a855bdd0979fd36b437f6033736ad4bb'
            '8aa387578c1756e573f6558a66be25fc96d7e8567fb7bee580159479841f5f45'
            '516c479558576c6c5a2509abfcbf4fdafb5953d252e7a4ab972f9db6137daca8'
            '5d40bd6e1843150912dc52932eaa94c0f6d57931fd45a3769ef40e2335fe3c6f'
            '6c428b9296376e4b5e2aaf503a754a1ba58333aab50c82279b7c5615d8dd9e69'
            '92dc68f6bc19852e54ed929bd84eef9d0188a78fe47439316126b9c0c9f5c485'
            '28eb83c275b59fcebd7794a9c33c5c8b21a516c156b0c93f2f01e28dcb9ddf40'
            'dc3ba1108575b2c33d50f9725d6696ed34041b8458f07de379fb51f97da74e10'
            '7906efd34a30a42e6a252d8b859155e40fd6037111a6e5c3004c71e70b581e6f'
            '2c69190874fdd6d97157b41b77e5ec3b534af926cac2a9fd61f383a4a19d3d5a'
            'cfdc26eea9009c88b923e71ed847b412b628d25276a8edf0639e341ed0813575'
            '8adb6c5adb131ffbe65b39d9dc0e7a5bac895b9368a353bc554bdf9c8528925b'
            '95624a0c8e0ab0222302e3ebd6d2b63f59f5163bf2e99bd6dca460da2e846cee'
            '1d8dcb1d70a9106e8cbfe36a696e6a85c5bc0e1347fd25ffdbf92f93ce16ee71'
            '2924f1cc2cb243e70537c61543939c2843ef8e9f821b143caa68f44319d2677c'
            '77438fb4c10f001aa36bf355f429d4f566e1b10e8ba59599f7fc2d551ff1676d'
            '682025caaf66cda6044b7cc0260122c8ecafa88cbbc2f6cc320237343e814e50'
            '32d0deb68acdf7829e705b64d28bf66db917487824982506ddc050ea014f0225'
            'fb0a42b7e03d62853ab9efdadcc9c4832bcb0177b9820914f05d60f05c8094c5'
            '3a70503d841d0ffc6fa226cdb43e7563a9d2ae30c8e472c732de3a065d518686'
            'd5984ce26336f24e7a542dcc00f872dd519a20ac8c46c0bd4a99ad07dde719e3')

prepare() {
  cd $_pkgname-$pkgver

  # Upstream patch that moves gnome-screensaver desktop file out of autostart
  patch -Np1 -i ../move-desktop-file.patch

  # Fix build
  patch -Np1 -i ../fix-autoconf.patch

  # Fix systemd support
  patch -Np1 -i ../fix-systemd-support.patch

  # Lock screen on suspend with systemd
  patch -Np1 -i ../lock_screen_on_suspend.patch

  # Add support for user switch with LightDM
  patch -Np1 -i ../lightdm_switch_user.patch

  # Restore the original position after shake
  patch -Np1 -i ../recenter.patch

  # Fix build with systemd support
  sed -i 's/libsystemd-login libsystemd-daemon/libsystemd/' configure.ac
  
  # Ubuntu Budgie patches
  patch -Np1 -i ../03_fix_ltsp-fading.patch
  
  patch -Np1 -i ../05_dbus_service.patch
  
  patch -Np1 -i ../10_legacy_scrsvr_inhibit.patch
  
  patch -Np1 -i ../13_nvidia_gamma_fade_fallback.patch
  
  patch -Np1 -i ../14_no_fade_on_user_switch.patch
  
  patch -Np1 -i ../15_dont_crash_on_no_fade.patch
  
  patch -Np1 -i ../16_dont_crash_in_kvm.patch
  
  patch -Np1 -i ../25_fix_lock_command.patch
  
  patch -Np1 -i ../29_handle_expired_creds.patch
  
  patch -Np1 -i ../move-not-nuke.patch
  
  patch -Np1 -i ../allow-replacement
  
  patch -Np1 -i ../18_unity_dialog_layout.patch
  
  patch -Np1 -i ../32_input_sources_switcher.patch
  
  patch -Np1 -i ../24_use_user_settings.patch
  
  patch -Np1 -i ../17_remove_top_panel.patch
  
  patch -Np1 -i ../33_budgie_support.patch

  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  CFLAGS+=" -Wno-error=return-type"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --with-mit-ext --without-console-kit --with-systemd
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../gnome-screensaver.pam "$pkgdir/etc/pam.d/gnome-screensaver"
}
