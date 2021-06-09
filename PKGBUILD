# Maintainer: Synology Inc.
# Contributor: Wayne Lai <abev66@gmail.com>
pkgname=synochat
pkgver=1.1.1.57
pkgrel=1
pkgdesc="Synology Chat Client is the desktop client software of Synology Chat."
arch=('x86_64')
url="https://www.synology.com/dsm/feature/chat"
license=('non-free')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'scrot' 'alsa-lib' 'nss' 'libxtst' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("http://global.download.synology.com/download/Utility/ChatClient/1.1.1-57/Ubuntu/x86_64/Chat_1.1.1-57_amd64.deb"
        "http://archive.ubuntu.com/ubuntu/pool/main/h/harfbuzz/libharfbuzz0b_1.7.2-1ubuntu1_amd64.deb"
        "http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb"
        "http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb"
        'http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb')
noextract=("libharfbuzz0b_1.7.2-1ubuntu1_amd64.deb"
           "libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb"
           "libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb"
           "libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb")
sha512sums=('702fb5566874dabe780f506defdbd69d3f65377875c6d1a6c8f97eaf4ac640a7cebe93ef370d9ec5cec58bd89908bb86649b6dba2335ac0c8fcfc92abf59d094'
            'a5e3cf6510b392f517c473b2dd3cb3a6e62d624b8a2cd42f1691cedb9c2edb58f5bcdab361156caeab3a8f6da49b6b934f367582828fbb800d75dc75b674fedd'
            'c136202a86a60f4b0df8f1bc76b62a11a23c7626dce7274fb0b9d40fc172fc12e40106a560f56334e75b33496adf41dddc961e0d590fdb7c4fc7151f96b5c0b5'
            'e3796052cd33fec46a63f67e1b390eef80647f74fb2980e4a8b075f4d41454d928df0116d33bd6df91f196a5faa81b58ef1611fae4f1f2102eddcb355fa6ab6a'
            '4f05f4da0df9b2a8522de78d1104549408ea9daf4de3812c42d18165d8599fe8b65e71cd1860c60577929ae818abf6d3ff2253f75c22b5535524bb78620fab1b')

package(){
    # Extract depend libraries
    mkdir -p harfbuzz libpango pangocairo libpangoft2
    bsdtar -xf libharfbuzz0b_1.7.2-1ubuntu1_amd64.deb -C harfbuzz
    bsdtar -xf libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb -C libpango
    bsdtar -xf libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb -C pangocairo
    bsdtar -xf libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb -C libpangoft2

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	
	tar xf harfbuzz/data.tar.xz --transform='s,.*/,,' -C "${pkgdir}/opt/Synology Chat/" ./usr/lib/x86_64-linux-gnu/libharfbuzz.so.0.10702.0 ./usr/lib/x86_64-linux-gnu/libharfbuzz.so.0
	tar xf libpango/data.tar.xz --transform='s,.*/,,' -C "${pkgdir}/opt/Synology Chat/" ./usr/lib/x86_64-linux-gnu/libpango-1.0.so.0.4000.14 ./usr/lib/x86_64-linux-gnu/libpango-1.0.so.0
	tar xf pangocairo/data.tar.xz --transform='s,.*/,,' -C "${pkgdir}/opt/Synology Chat/" ./usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0 ./usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0.4000.14
	tar xf libpangoft2/data.tar.xz --transform='s,.*/,,' -C "${pkgdir}/opt/Synology Chat/" ./usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0.4000.14 ./usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0

}
