# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# mindmaster 中文版

pkgname=mindmaster_cn
_pkgname=MindMaster-10
_softname=mindmaster
pkgver=10.0.3
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster" "mindmaster-cn" "mindmaster_en")
replaces=('mindmaster-cn')
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}_${pkgver}_cn.${arch}.deb")
sha256sums_x86_64=('ff5fb31a0dea8dc65e29cceedccfa31524c53031fe5d142e0d9fef5c847249dc')
noextract=("${_softname}_${pkgver}_cn.${arch}.deb")

prepare() {
#    ar -x *.rpm
	mkdir -p ${pkgname}
    bsdtar -xf "${srcdir}/${_softname}_${pkgver}_cn.${arch}.deb" --numeric-owner -C "${srcdir}/${pkgname}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/${pkgname}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${_softname}" << EOF
#!/bin/sh
/opt/${_pkgname}/MindMaster "\$@" --no-sandbox
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/opt/${_pkgname}/${_softname}.desktop" << EOF
[Desktop Entry]
Name=MindMaster
Name[en_US]=mindmaster
Categories=Office;MindMap;Brainstorming;Mind;Map;
MimeType=application/x-emmx
Exec=mindmaster %U
Terminal=false
Type=Application
Icon=mindmaster.png
Encoding=UTF-8
Hidden=false
StartupNotify=false
X-Deepin-Vendor=EdrawSoft
Keywords=MindMaster;Mind;Brainstorming;Map;
Keywords[de]=MindMaster;MindMap;
Keywords[fr]=MindMaster;MindMap;
Keywords[ja]=MindMaster;MindMap;
Keywords[es]=MindMaster;Diagrama;
Keywords[zh_CN]=MindMaster;MindMap;
Keywords[zh_TW]=MindMaster;MindMap;
Comment=Mind Map Software
Comment[de]=mind map - software
Comment[fr]=Logiciel de carte
Comment[ja]=マインドマップソフト
Comment[es]=Mind Map Software
Comment[zh_CN]=思维导图软件
Comment[zh_TW]=心智圖軟件

EOF
#     ln -sf "/opt/${_pkgname}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
}


