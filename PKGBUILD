# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=coreutils-arch
pkgver=9.6
pkgrel=1
pkgdesc="GNU arch command (from coreutils)"
arch=('x86_64')
url="https://www.gnu.org/software/coreutils/coreutils.html"
license=('GPL-3.0-or-later')
depends=('coreutils')
makedepends=('gettext' 'gperf' 'gzip' 'perl' 'rsync' 'tar' 'texinfo')
source=("https://ftp.gnu.org/gnu/coreutils/coreutils-$pkgver.tar.xz")
sha256sums=('7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283')

build() {
	cd "coreutils-$pkgver"
	./configure --prefix="/usr" --libexecdir="/usr/lib" --enable-install-program="arch" --enable-no-install-program="[,b2sum,base32,base64,basename,basenc,cat,chcon,chgrp,chmod,chown,chroot,cksum,comm,cp,csplit,cut,date,dd,df,dir,dircolors,dirname,du,echo,env,expand,expr,factor,false,fmt,fold,groups,head,hostid,id,install,join,kill,link,ln,logname,ls,md5sum,mkdir,mkfifo,mknod,mktemp,mv,nice,nl,nohup,noinstall.txt,nproc,numfmt,od,paste,pathchk,pinky,pr,printenv,printf,ptx,pwd,readlink,realpath,rm,rmdir,runcon,seq,sha1sum,sha224sum,sha256sum,sha384sum,sha512sum,shred,shuf,sleep,sort,split,stat,stdbuf,stty,sum,sync,tac,tail,tee,test,timeout,touch,tr,true,truncate,tsort,tty,uname,unexpand,uniq,unlink,uptime,users,vdir,wc,who,whoami,yes"
	make
}

package() {
	cd "coreutils-$pkgver"
	make DESTDIR="$pkgdir" install
	rm $pkgdir/usr/bin/install
	rm -rf $pkgdir/usr/share/info
	rm -rf $pkgdir/usr/share/locale
	rm $pkgdir/usr/share/man/man1/install.1
}
