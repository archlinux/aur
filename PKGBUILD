# Maintainer:  taotieren <admin@taotieren.com>

pkgbase=minigui-git
pkgname=(minigui-{,{mgutils,mgplus,mgeff,mgncs,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,res,docs}-}git)
pkgver=5.0.11.r12.g0d1f1f02
pkgrel=1
arch=('any')
_url="https://github.com/VincentWei"
url="${_url}/MiniGUI"
license=('GPLv3')
provides=(minigui{,-{mgutils,mgplus,mgeff,mgncs,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,res,docs}})
conflicts=(minigui{,-{mgutils,mgplus,mgeff,mgncs,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,res,docs}})
# replaces=(${pkgname})
depends=(
        chipmunk
        freetype2
        harfbuzz
        libdrm
        libevdev
        libjpeg-turbo
        libinput
        libpng
        kmod
        mtdev
        util-linux
        sqlite
        systemd
        pkgconf
        zlib)
optdepends=()
makedepends=(git
            automake)
backup=()
options=('!strip')
install=
source=("${pkgbase}::git+${url}.git"
        "minigui-mgutils::git+${_url}/mgutils.git"
        "minigui-mgplus::git+${_url}/mgplus.git"
        "minigui-mgeff::git+${_url}/mgeff.git"
        "minigui-mgncs::git+${_url}/mgncs.git"
        "minigui-mgncs4touch::git+${_url}/mgncs4touch.git"
        "minigui-mg-tools::git+${_url}/mg-tools.git"
        "minigui-mg-tests::git+${_url}/mg-tests.git"
        "minigui-mg-samples::git+${_url}/mg-samples.git"
        "minigui-mg-demos::git+${_url}/mg-demos.git"
        "minigui-cell-phone-ux-demo::git+${_url}/cell-phone-ux-demo.git"
        "minigui-res::git+${_url}/minigui-res.git"
        "minigui-docs::git+${_url}/minigui-docs.git")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    git describe --long --tags | sed 's/ver-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    install -Dm0755 /dev/stdin "${srcdir}/myconfig.sh" << EOF
# This is the template of `myconfig.sh`, and the later
# will be included in every script.

# PLEASE COPY THIS FILE TO `myconfig.sh`,
# AND CHANGE THE FOLLOWING GLOBAL VARIABLES FOR YOUR CUSTOMIZATION.

#
# The URL prefix of remote repository.

# Use this if you want to use the repos on gitlab.fmsoft.cn via HTTPS (recommended)
REPO_URL=https://gitlab.fmsoft.cn/VincentWei

# Use this one if you are a developer of MiniGUI
# REPO_URL=git4os@gitlab.fmsoft.cn:VincentWei

# Use this if you want to visit GitHub via HTTPS
# REPO_URL=https://github.com/VincentWei

# Use this one if you can visit GitHub via SSH
# REPO_URL=git@github.com:VincentWei

#
# The branch name
BRANCH_NAME=rel-5-0

#
# Global configuration options for MiniGUI Core and components.
# GOPTS="--enable-develmode"
GOPTS=

#
# extra options for configuring MiniGUI Core.
# MGOPTS="--with-targetname=external"
MGOPTS=

#
# The jobs number for building source.
NRJOBS=`getconf _NPROCESSORS_ONLN`
EOF

}


package_minigui-mgutils-git() {
    pkgdesc="A component of MiniGUI, provides users with a number of common dialog templates"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgplus-git() {
    pkgdesc="A MiniGUI component which provides support for advanced 2D graphics functions"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgeff-git() {
    pkgdesc="An animation framework for MiniGUI"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgncs-git() {
    pkgdesc="mGNCS provides a new control set and a new framework for MiniGUI apps."

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgncs4touch-git() {
    pkgdesc="A set of mGNCS-compliant controls for devices with a touch screen."

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-tools-git() {
    pkgdesc="A modern and proven cross-platform window system for embedded systems or smart IoT devices."

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-tests-git() {
    pkgdesc="Test code of MiniGUI Core"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-samples-git() {
    pkgdesc="Basic Samples for MiniGUI Core and Key MiniGUI Components."

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-demos-git() {
    pkgdesc="A set of demos as supplements of cell-phone-ux-demo"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-cell-phone-ux-demo-git() {
    pkgdesc="This UX demo shows the new features of MiniGUI core, mGEff, mGNCS, and mGNCS4Touch components."

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-res-git() {
    pkgdesc="Resources package for MiniGUI"

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-docs-git() {
    pkgdesc="Documents for MiniGUI Core and MiniGUI Components."

    install -dm0755 ${pkgdir}/usr/share/doc
    cp -rv "${srcdir}"/${pkgname%-git}  "${pkgdir}"/usr/share/doc/
}

package_minigui-git() {
    pkgdesc="A modern and proven cross-platform window system for embedded systems or smart IoT devices."
    depends=(minigui-{mgutils,mgplus,mgeff,mgncs,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,res,docs})

    source "${srcdir}/myconfig.sh"
    cd "${srcdir}/${pkgbase}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-static $GOPTS

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}
