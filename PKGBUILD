# Maintainer: Indexyz <jiduye@gmail.com>
# Maintainer: 影子 <924068818@qq.com>
_pkgname=FinalShell
_pkgnameL=finalshell
pkgname=finalshell
pkgver=3.8.3
pkgrel=1
epoch=0
pkgdesc="一体化的的服务器,网络管理软件,不仅是ssh客户端,还是功能强大的开发,运维工具,充分满足开发,运维需求."
arch=('x86_64')
url="http://www.hostbuf.com/"
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#changelog="http://www.hostbuf.com/t/989.html"
source=("https://master.dl.sourceforge.net/project/${_pkgnameL}/${_pkgnameL}_linux-${pkgver}.zip"  'LICENSE::http://www.hostbuf.com/t/1081.html')
noextract=()
license=('custom')
md5sums=('bfbc2e207958792a00a640662dab1bb3' 'SKIP')
sha256sums=('5822aecfa9840aeab01dcae5de3976ffa479c07a9cef89ae93a57065d750884e' 'SKIP')
#validpgpkeys=()

#prepare() {
	#cd ${srcdir}
	#unzip -o ${pkgname}_linux
	#mv FinalShell ${pkgname}
	#mv ${pkgname}/bin/FinalShell ${pkgname}/bin/${pkgname}
#}

#check() {
#	make -k check
#}

package() {
	install_path=${pkgdir}'/usr/lib'
    echo "pkgdir is ${pkgdir}"
    mkdir -p $install_path


	cd ../
    cp -r $srcdir/$_pkgname $install_path

	 cd $install_path/$_pkgname/lib/app/
	

    #安装图标	
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	mkdir -p ${pkgdir}/usr/share/applications

	cp img/finalshell.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	cp finalshell.desktop ${pkgdir}/usr/share/applications

    #修改权限
	find $install_path/FinalShell -type d -exec chmod 755 {} \;
	
	chmod -R 755 $install_path/FinalShell/lib/runtime/lib/classlist;
	chmod -R 755 $install_path/FinalShell/lib/runtime/lib/jexec;
	chmod -R 755 $install_path/FinalShell/lib/runtime/lib/jspawnhelper;
	chmod -R 755 $install_path/FinalShell/lib/runtime/lib/modules;
	chmod -R 755 $install_path/FinalShell/lib/runtime/lib/security/cacerts;
	
	chmod 755 $install_path/FinalShell/bin/FinalShell;


	sudoer=$USER
	chown -R $sudoer $install_path/FinalShell
	setcap cap_net_raw,cap_net_admin=eip $install_path/FinalShell/bin/FinalShell
	echo  "  FinalShell安装完成"
}
