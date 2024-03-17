# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

# Based on PKGBUILD for package: extra/xfwm4 (4.18.0-1)
pkgname=xfwm4-windowcenter
pkgver=4.18.0
pkgrel=2
pkgdesc="Xfce's window manager, with a patch to allow titles to be centered relatively to the full window width."
arch=('x86_64')
url="https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
provides=("xfwm4=$pkgver")
conflicts=("xfwm4")
source=("$pkgname::git+https://gitlab.xfce.org/xfce/xfwm4.git#tag=xfwm4-$pkgver"
        pr27{,-locale-pl}.patch)
md5sums=('SKIP'
         '24a805493328f9fd35b6dd1dac13c730'
         '9738e1c819e54fbdf11747cecfc9ee6f')
sha512sums=('SKIP'
            'eb3be24eb811ad3e8d8bb23abd89131da6fbce18e333e01abc38fd441c848bad9f8fc60be771501295447b71e18544f22406a75d970c9ca51e82539fc30d1202'
            '4644bddc53258b6774f6936ce3be083a844a61e2b7c4f819f300664514a525379298954473dde38dc8620bfaf1cc64d2909474aba81f34f7bc86390d7b0658f2')
b2sums=('SKIP'
        '5a33a77450b28534ee3c6aba228699d688619add6e8f6b6d7d524d9159fe7e519ea01924e9571ed080206b1f407d25c396bbd1d458d26d5de86ca8a6e1fc20e7'
        '6cfede493b48105130cff15101958dafbc4317774d9d4577edb705745ff94924dc827c09febdf7537e527a0b46d25d8cd1c2ca396dcd4c33a19a63673818434a')

prepare(){
  cd $pkgname
  # Original patch by Ryan Bester (see $url for the reference)
  # Backported for 4.18.0 and localized to Polish by SpacingBat3
  git apply ../pr27{,-locale-pl}.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-maintainer-mode \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
