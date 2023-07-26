pkgname=fzf-tab-source
pkgver=1.0.0
pkgrel=1
pkgdesc="替代zsh的命令补全功能，加入文件和目录预览，可使用rg和rga辅助fzf搜索
Replace zsh's default completion selection menu with fzf.Add file and directory previews,and can use rg or rga to assist fzf searches"
arch=('x86_64')
url="https://github.com/aslingguang/fzf-tab-source"
license=('GPL')
depends=('zsh' 'fzf')

optdepends=('exa: 目录结构预览'
	'chafa: 图片预览'
	'exiftool: 元数据预览'
	'pdftotext: pdf预览'
	'bat: 文本预览'
	'xlsx2csv: xlsx2csv预览'
	'xls2csv: xls2csv预览'
	'csvkit: xlsx2csv和xls2csv预览'
	'pandoc: docx预览'
	'atool: deb,gz,jar,rpm,tar,tgz,xz,zip等预览 '
	'unrar: rar预览'
	'7z: 7z预览')
source=("https://github.com/aslingguang/fzf-tab-source/releases/download/v1.0.0/fzf-tab-source.tar.gz")
sha256sums=('c167969b7319146aa2f56d6de70b080b124d9e858fc467a3243b5e65ffb19191')

package() {
	cd "$srcdir/fzf-tab-source"
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/fzf-tab-source" "$pkgdir/opt"
	chmod +x "$pkgdir/opt/fzf-tab-source"
}

post_upgrade() {
	# 在安装完成后执行 source ~/.zshrc
	cd /opt/fzf-tab-source
	./install_script.sh
}

post_remove() {
	# 在安装完成后执行 source ~/.zshrc
	sed -i "/source \/opt\/fzf-tab-source\/fzf-tab.plugin.zsh/d" "$HOME/.zshrc"
	echo "Content removed from $HOME/.zshrc"
}
