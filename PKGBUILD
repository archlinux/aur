# Maintainer: sfs <sfslinux@gmail.com>

# Based on AUR multiload-ng-indicator-gtk3 (Michael Kogan, Mario Cianciolo)
# Adds: libayatana-appindicator migration + Wayland draw-handler fix.
# Ships both the tray indicator and the standalone window; the core lib is
# linked statically, so multiload-ng-common is not required.

pkgname='multiload-ng-indicator-gtk3-wayland'
pkgdesc='Modern graphical system monitor: AppIndicator tray plugin + standalone window (Ayatana + Wayland fixes)'
pkgver=1.5.2
pkgrel=22

arch=('i686' 'x86_64')
url='https://udda.github.io/multiload-ng/'
license=('GPL2')

makedepends=('intltool' 'autoconf' 'automake' 'libtool' 'pkgconf')
depends=('gtk3' 'cairo' 'libayatana-appindicator')

provides=('multiload-ng-indicator-gtk3' 'multiload-ng-standalone-gtk3')
conflicts=('multiload-ng-indicator-gtk3' 'multiload-ng-indicator-gtk2'
           'multiload-ng-indicator-gtk2-git' 'multiload-ng-indicator-gtk3-git'
           'multiload-ng-standalone-gtk3' 'multiload-ng-standalone-gtk2'
           'multiload-ng-standalone-gtk2-git' 'multiload-ng-standalone-gtk3-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/udda/multiload-ng/archive/v$pkgver.tar.gz"
        'build-fix.patch'
        'build-fix2.patch'
        '0003-wayland-draw-handler.patch'
        '0004-libayatana-appindicator.patch'
        '0005-standalone-no-button-rightclick.patch'
        '0006-indicator-icon-height-option.patch'
        '0007-indicator-split-tray-icons.patch'
        '0008-indicator-graph-info-in-tray-title.patch'
        '0009-indicator-honor-graph-order.patch'
        '0010-preferences-clarify-reset-order-button.patch'
        '0011-temp-fix-source-selection-and-name-in-tooltip.patch'
        '0012-config-dir-option-and-standalone-labels.patch'
        '0013-indicator-unique-icon-filenames.patch'
        '0014-fix-graph-data-buffer-overflow.patch'
        '0015-indicator-unique-split-icon-filenames.patch'
        '0016-graph-net-cache-sysfs-attributes.patch'
        '0017-autoscaler-decay-peak.patch'
        '0018-indicator-menu-label-guard.patch'
        '0019-use-g_strlcpy-for-fixed-buffers.patch'
        '0020-disk-detect-sysfs-path-for-nvme-mmcblk.patch'
        '0021-mem-htop-compatible-accounting.patch'
        '0022-net-scale-graph-by-speed.patch'
        '0023-indicator-tray-label.patch'
        '0024-indicator-label-guide-by-width.patch'
        '0025-indicator-publish-label-before-registration.patch')
sha256sums=('ea77b84dc998c815f413a59d7e1461072abc19d97b64db6a0df4514fdc492d4a'
            'f98f8080dadc6a1d70cc535d365b84faf350b82d01d8611e243e5be848de9252'
            '6aad04eca3ac4bb3688d4e6ee4a8676dfa219c4925317ae716e122c63bf5f56b'
            '23d3c37700bac0f9c6dfdfda46008c080b8305f0ed63580d0e4a28b7e1cb89b5'
            'a4a7024a7296b18808c76c7fa1ea0466db1fe17e14e9a287a884425d33fb1ab6'
            'e32c0121008523828d428a60e673aaf8ca7d55566855bcbb11c2d8473da0030b'
            '7c37037f863ca72e1f7fb37bb6bcc81a639a4de4aad0b73e100f45be5c0a9f8c'
            '96b7c42ff2cf66683d1fb4db6dc2e1f949ef874a2a5078804040d8b93d661a0a'
            'd722a5f01e5821fbe06b4b8355fa8b61a04134da393bc27d3e3c8ba10f6e82e6'
            'ee8aafa40a969b2dcb7c42f7d5d4de3869a22f4cce2080e58e733a8ff9a2328b'
            '34824297e4bb04024fba2cc0ac91d629148e9eb1198d73e5561c0bf8dd8617c3'
            'fc8506462f6f5edf6fe323591201ddf52ab1ac76b182a3a3255da84ba0f134e7'
            '6d7a28f0ee059e42a64d36ac697ad98ded34684f0e5f4bc4fb596d15b844aa22'
            '4ee101b24b62021de0892f3666d99b3365968a6c0fd7319ab806cd9aab2d0101'
            'db180449b7b03a85e956d7f6aafebafa610c2da874d5b8bb827548e04f1a8a5f'
            'c8ae2114521af599828b02f2334e2d387de942f546e0e00a8be8d6aac9df344a'
            '54f9e431476ec386cec4d59076f708a196293eb688268ecf8b365196230d3a4e'
            '6b5da0117fb92ba67b8dd840a8df48e055dfe58349207095f7e27308f49736d6'
            'a1c1d7f83cee9671fe4eddaa77ac66edf40e06eadcc0285e4d215329c7568165'
            '5293c13ba52854d367792a77c4fd274ac4f53cd5621f7f2893718f99d3d7921d'
            '2437107c21a4e2538b41378fa7836ec787250f61cbbacd78116fd0aa5a89e948'
            '2648521c53f7e7250827b521682ea47e0e38501dbc2aa1e34138820ab0081143'
            '30243f048c9529aa5198cd101055424e0cf607a43192cf739ba0ed8100d27702'
            'aca52ed4652da473552bcfa8e8770ebf32ca933ba42e7f3c626411f519f48189'
            '00bca5c5a5816ed27b4bd142d66a0b1310e4f3182a0f04f96c68b21953bfb51f'
            'c81ee6f4d42005b0f8edb6c889130ea48ed370b29f907c8d2aa52e54bdc20730')

prepare() {
    cd "multiload-ng-$pkgver"
    patch -p1 -i "$srcdir/build-fix.patch"
    patch -p1 -i "$srcdir/build-fix2.patch"
    patch -p1 -i "$srcdir/0003-wayland-draw-handler.patch"
    patch -p1 -i "$srcdir/0004-libayatana-appindicator.patch"
    patch -p1 -i "$srcdir/0005-standalone-no-button-rightclick.patch"
    patch -p1 -i "$srcdir/0006-indicator-icon-height-option.patch"
    patch -p1 -i "$srcdir/0007-indicator-split-tray-icons.patch"
    patch -p1 -i "$srcdir/0008-indicator-graph-info-in-tray-title.patch"
    patch -p1 -i "$srcdir/0009-indicator-honor-graph-order.patch"
    patch -p1 -i "$srcdir/0010-preferences-clarify-reset-order-button.patch"
    patch -p1 -i "$srcdir/0011-temp-fix-source-selection-and-name-in-tooltip.patch"
    patch -p1 -i "$srcdir/0012-config-dir-option-and-standalone-labels.patch"
    patch -p1 -i "$srcdir/0013-indicator-unique-icon-filenames.patch"
    patch -p1 -i "$srcdir/0014-fix-graph-data-buffer-overflow.patch"
    patch -p1 -i "$srcdir/0015-indicator-unique-split-icon-filenames.patch"
    patch -p1 -i "$srcdir/0016-graph-net-cache-sysfs-attributes.patch"
    patch -p1 -i "$srcdir/0017-autoscaler-decay-peak.patch"
    patch -p1 -i "$srcdir/0018-indicator-menu-label-guard.patch"
    patch -p1 -i "$srcdir/0019-use-g_strlcpy-for-fixed-buffers.patch"
    patch -p1 -i "$srcdir/0020-disk-detect-sysfs-path-for-nvme-mmcblk.patch"
    patch -p1 -i "$srcdir/0021-mem-htop-compatible-accounting.patch"
    patch -p1 -i "$srcdir/0022-net-scale-graph-by-speed.patch"
    patch -p1 -i "$srcdir/0023-indicator-tray-label.patch"
    patch -p1 -i "$srcdir/0024-indicator-label-guide-by-width.patch"
    patch -p1 -i "$srcdir/0025-indicator-publish-label-before-registration.patch"
}

build() {
    cd "multiload-ng-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --with-gtk=3.0 --disable-deprecations \
        --without-awn --with-indicator --without-lxpanel --without-mate \
        --with-standalone --without-systray --without-xfce4
    make
}

package() {
    cd "multiload-ng-$pkgver"
    make DESTDIR="$pkgdir" install
    # launch is managed by the WM autostart, not by xdg-autostart
    rm -f "$pkgdir/etc/xdg/autostart/multiload-ng-indicator.desktop"
}
