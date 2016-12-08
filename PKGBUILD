# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=vp
pkgver=2.1.279
pkgrel=1
pkgdesc="Virtual Pascal IDE & compiler"
arch=('i686' 'x86_64')
url="http://vpascal.ning.com/"
license=('custom')
depends_i686=('glibc')
depends_x86_64=('lib32-glibc')
makedepends=('unrar')
options=('!strip')
backup=('opt/vp21/bin.lnx/vp.vpo')
source=("vp21b279.zip::http://outpostbbs.net/files/vp21b279.zip")
md5sums=('ed0ea436b15cba55c35f72ffbe87f26c')
sha1sums=('bcc679532668fae986fe9c194a5331cbb7863a29')
sha224sums=('6d23cb93787fb475f09cecfa3523fc5d2e690aa56b48869957178f93')
sha256sums=('786b4f5da3863ea4cedc614aaf94c90004dc67b7e1ae09d8c829a84199262ac9')

package() {
	mkdir -pv "$pkgdir"/opt/vp21/common
	mkdir -pv "$pkgdir"/opt/vp21/doc/os2
	mkdir -pv "$pkgdir"/opt/vp21/{{bin,units,res}.{os2,w32,lnx},lib.{os2,w32,lnx}/defs}
	mkdir -pv "$pkgdir"/opt/vp21/out.{os2,w32,lnx}/units
	mkdir -pv "$pkgdir"/opt/vp21/examples/lnx
	mkdir -pv "$pkgdir"/opt/vp21/examples/w32/{glide,gui,opengl/{metabls,pctwatch,shared,stencil}}
	mkdir -pv "$pkgdir"/opt/vp21/examples/os2/{clock,dive,ea,flame,objclass}
	mkdir -pv "$pkgdir"/opt/vp21/examples/os2/{os2exec,rexx,syslevel,triplex}
	mkdir -pv "$pkgdir"/opt/vp21/examples/common/bp7/{breakout,tvdemo,tvfm}
	mkdir -pv "$pkgdir"/opt/vp21/examples/common/{delphi,dll,memmgr,msgfltr}
	mkdir -pv "$pkgdir"/opt/vp21/{examples/common/{ratrace,sort,test,testutil,touch,unrar},tests}
	mkdir -pv "$pkgdir"/opt/vp21/source/{rtl/sys,os2,w32,lnx/{linklnx,pe2elf},tv,opro,demo}
	mkdir -pv "$pkgdir"/usr/bin
	unrar x -cl -r -o+ aidevph.rar \* "$pkgdir"/opt/vp21/common
	unrar x -cl -r -o+ aidedoc.rar \* "$pkgdir"/opt/vp21/doc
	unrar x -cl -r -o+ ovpbase.rar \* "$pkgdir"/opt/vp21/bin.os2
	unrar x -cl -r -o+ ortlbin.rar \* "$pkgdir"/opt/vp21/units.os2
	unrar x -cl -r -o+ oapilib.rar \* "$pkgdir"/opt/vp21/lib.os2
	unrar x -cl -r -o+ oresbin.rar \* "$pkgdir"/opt/vp21/res.os2
	unrar x -cl -r -o+ wvpbase.rar \* "$pkgdir"/opt/vp21/bin.w32
	unrar x -cl -r -o+ wrtlbin.rar \* "$pkgdir"/opt/vp21/units.w32
	unrar x -cl -r -o+ wapilib.rar \* "$pkgdir"/opt/vp21/lib.w32
	unrar x -cl -r -o+ wresbin.rar \* "$pkgdir"/opt/vp21/res.w32
	unrar x -cl -r -o+ lvpbase.rar \* "$pkgdir"/opt/vp21/bin.lnx
	unrar x -cl -r -o+ lrtlbin.rar \* "$pkgdir"/opt/vp21/units.lnx
	unrar x -cl -r -o+ lapilib.rar \* "$pkgdir"/opt/vp21/lib.lnx
	unrar x -cl -r -o+ lresbin.rar \* "$pkgdir"/opt/vp21/res.lnx
	unrar x -cl -r -o+ oapivph.rar \* "$pkgdir"/opt/vp21/common
	unrar x -cl -r -o+ oapiinf.rar \* "$pkgdir"/opt/vp21/doc/os2
	unrar x -cl -r -o+ oexmpsrc.rar \* "$pkgdir"/opt/vp21/examples/os2
	unrar x -cl -r -o+ wexmpsrc.rar \* "$pkgdir"/opt/vp21/examples/w32
	unrar x -cl -r -o+ lexmpsrc.rar \* "$pkgdir"/opt/vp21/examples/lnx
	unrar x -cl -r -o+ artlvph.rar \* "$pkgdir"/opt/vp21/common
	unrar x -cl -r -o+ artlsrc.rar \* "$pkgdir"/opt/vp21/source/rtl
	unrar x -cl -r -o+ ortlsrc.rar \* "$pkgdir"/opt/vp21/source/os2
	unrar x -cl -r -o+ wrtlsrc.rar \* "$pkgdir"/opt/vp21/source/w32
	unrar x -cl -r -o+ lrtlsrc.rar \* "$pkgdir"/opt/vp21/source/lnx
	unrar x -cl -r -o+ aexmpsrc.rar \* "$pkgdir"/opt/vp21/examples/common
	unrar x -cl -r -o+ testsrc.rar \* "$pkgdir"/opt/vp21/examples/tests
	unrar x -cl -r -o+ atvsrc.rar \* "$pkgdir"/opt/vp21/source/tv
	unrar x -cl -r -o+ op130vp.rar \* "$pkgdir"/opt/vp21/source/opro
	unrar x -cl -r -o+ ox130vp.rar \* "$pkgdir"/opt/vp21/source/opro/demo
	unrar x -cl -r -o+ oh130vp.rar \* "$pkgdir"/opt/vp21/common
	chmod +x "$pkgdir"/opt/vp21/bin.lnx/*
	chmod 666 "$pkgdir"/opt/vp21/bin.lnx/vp.vpo # VP needs write permissions on this file
	sed -i "s|\\\|\/|g" "$pkgdir"/opt/vp21/bin.lnx/vp.vpo
	sed -i "s|{BASEDIR}|/opt/vp21|g" "$pkgdir"/opt/vp21/bin.lnx/vp.vpo
	ln -s /opt/vp21/bin.lnx/pe2elf "$pkgdir"/usr/bin/pe2elf
	ln -s /opt/vp21/bin.lnx/vp "$pkgdir"/usr/bin/vp
	ln -s /opt/vp21/bin.lnx/vpc "$pkgdir"/usr/bin/vpc
	install -D -m644 licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
