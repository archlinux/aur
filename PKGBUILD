# Maintainer: Ben <bensongsyz@gmail.com>
pkgname='wudao-dict-git'
pkgver=2.1
pkgrel=1
pkgdesc='The command line version of Youdao Dictionary, supporting English-Chinese mutual search and online search.'
arch=('any')
url="https://github.com/ChestnutHeng/Wudao-dict"
license=('unknown')
depends=('python' 'python-bs4' 'python-lxml')
makedepends=('git')
source=('wudao-dict::git://github.com/ChestnutHeng/Wudao-dict.git')
md5sums=('SKIP')

package() {
	cd "$srcdir"

	mkdir -p "${pkgdir}/opt"
	cp -r "./wudao-dict" "${pkgdir}/opt/"

	# 用户词
	mkdir -p "${pkgdir}/opt/wudao-dict/wudao-dict/usr"
	chmod -R 777 "${pkgdir}/opt/wudao-dict/wudao-dict/usr"

	mkdir -p "${pkgdir}/usr/bin"

	# 添加系统命令wd
	cd "${pkgdir}/usr/bin"
	echo '#!/bin/bash'>./wd
	echo 'save_path=$PWD'>>./wd
	echo 'cd '/opt/wudao-dict/wudao-dict >>./wd
	echo './wdd $*'>>./wd
	echo 'cd $save_path'>>./wd
	chmod +x ./wd

	# 添加bash_completion自动补全
	mkdir -p "${pkgdir}/etc/bash_completion.d"
	ln -s /opt/wudao-dict/wudao-dict/wd_com "${pkgdir}/etc/bash_completion.d/wd"
}
